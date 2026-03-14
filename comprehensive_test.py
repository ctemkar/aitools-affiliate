#!/usr/bin/env python3
import os
import re
import subprocess
import json

def check_html_file(filepath):
    """Check a single HTML file for issues"""
    issues = []
    
    with open(filepath, 'r') as f:
        content = f.read()
    
    # Check for placeholder text
    placeholder_patterns = [
        r'\[YOUR_.*?_AFFILIATE_LINK\]',
        r'affiliate link here',
        r'placeholder',
        r'TODO',
        r'FIXME',
        r'Review content will be converted',
        r'\$\(pandoc'
    ]
    
    for pattern in placeholder_patterns:
        if re.search(pattern, content, re.IGNORECASE):
            issues.append(f"Placeholder text found: {pattern}")
    
    # Check links
    link_pattern = r'href="([^"]*)"'
    links = re.findall(link_pattern, content)
    
    for link in links:
        # Check for problematic internal links
        if link.startswith('../index.html#'):
            issues.append(f"Internal anchor link that may not work: {link}")
        elif link == '../index.html':
            issues.append(f"Link goes back to main site instead of external: {link}")
        elif link == 'index.html':
            issues.append(f"Relative link to index that may break: {link}")
        
        # Check external links
        if link.startswith('http'):
            # Test if link works
            try:
                result = subprocess.run(
                    ['curl', '-s', '-o', '/dev/null', '-w', '%{http_code}', '-L', link],
                    capture_output=True,
                    text=True,
                    timeout=5
                )
                status = result.stdout.strip()
                if status not in ['200', '301', '302']:
                    issues.append(f"External link returns {status}: {link}")
            except:
                issues.append(f"Could not test external link: {link}")
    
    return issues

def main():
    print("=== COMPREHENSIVE SITE AUDIT ===")
    print()
    
    all_issues = {}
    
    # Check all HTML files
    for root, dirs, files in os.walk('.'):
        for file in files:
            if file.endswith('.html'):
                filepath = os.path.join(root, file)
                issues = check_html_file(filepath)
                
                if issues:
                    all_issues[filepath] = issues
    
    # Print report
    if all_issues:
        print("❌ ISSUES FOUND:")
        print()
        
        for filepath, issues in all_issues.items():
            print(f"File: {filepath}")
            for issue in issues:
                print(f"  - {issue}")
            print()
        
        print(f"Total issues found: {sum(len(issues) for issues in all_issues.values())}")
    else:
        print("✅ No issues found!")
    
    # Check file structure
    print()
    print("=== FILE STRUCTURE CHECK ===")
    print()
    
    required_dirs = ['reviews', 'content/reviews']
    for dir_path in required_dirs:
        if os.path.exists(dir_path):
            file_count = len([f for f in os.listdir(dir_path) if f.endswith('.html') or f.endswith('.md')])
            print(f"✅ {dir_path}: {file_count} files")
        else:
            print(f"❌ Missing directory: {dir_path}")
    
    # Check review count
    review_files = [f for f in os.listdir('reviews') if f.endswith('-complete.html')]
    print(f"✅ Review pages: {len(review_files)}")
    
    # Save report
    report = {
        'timestamp': subprocess.run(['date', '+%Y-%m-%d %H:%M:%S'], capture_output=True, text=True).stdout.strip(),
        'issues_found': len(all_issues),
        'total_issues': sum(len(issues) for issues in all_issues.values()),
        'review_count': len(review_files),
        'details': all_issues
    }
    
    with open('site_audit_results.json', 'w') as f:
        json.dump(report, f, indent=2)
    
    print()
    print(f"✅ Audit complete. Results saved to site_audit_results.json")

if __name__ == '__main__':
    main()
