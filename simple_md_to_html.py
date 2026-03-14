#!/usr/bin/env python3
import os
import re
import sys

def markdown_to_html(md_text):
    """Simple markdown to HTML converter"""
    # Headers
    md_text = re.sub(r'^# (.*?)$', r'<h1>\1</h1>', md_text, flags=re.MULTILINE)
    md_text = re.sub(r'^## (.*?)$', r'<h2>\1</h2>', md_text, flags=re.MULTILINE)
    md_text = re.sub(r'^### (.*?)$', r'<h3>\1</h3>', md_text, flags=re.MULTILINE)
    
    # Bold
    md_text = re.sub(r'\*\*(.*?)\*\*', r'<strong>\1</strong>', md_text)
    
    # Italic
    md_text = re.sub(r'\*(.*?)\*', r'<em>\1</em>', md_text)
    
    # Lists
    md_text = re.sub(r'^- (.*?)$', r'<li>\1</li>', md_text, flags=re.MULTILINE)
    md_text = re.sub(r'(<li>.*?</li>\n)+', r'<ul>\g<0></ul>', md_text)
    
    # Paragraphs
    lines = md_text.split('\n')
    result = []
    in_paragraph = False
    current_para = []
    
    for line in lines:
        if line.strip() and not line.startswith(('<', '#')) and not line.startswith('- '):
            current_para.append(line)
            in_paragraph = True
        elif in_paragraph:
            if current_para:
                result.append('<p>' + ' '.join(current_para) + '</p>')
                current_para = []
            in_paragraph = False
            if line.strip():
                result.append(line)
        else:
            result.append(line)
    
    if current_para:
        result.append('<p>' + ' '.join(current_para) + '</p>')
    
    return '\n'.join(result)

def convert_reviews():
    """Convert all markdown reviews to HTML"""
    review_dir = 'content/reviews'
    output_dir = 'reviews'
    
    if not os.path.exists(output_dir):
        os.makedirs(output_dir)
    
    for md_file in os.listdir(review_dir):
        if md_file.endswith('-complete.md'):
            # Read markdown
            with open(os.path.join(review_dir, md_file), 'r') as f:
                md_content = f.read()
            
            # Convert to HTML
            html_content = markdown_to_html(md_content)
            
            # Create HTML file
            html_file = md_file.replace('.md', '.html')
            
            # Read template
            with open(os.path.join(output_dir, html_file), 'r') as f:
                template = f.read()
            
            # Replace placeholder
            new_content = template.replace(
                '$(pandoc -f markdown -t html "$review" 2>/dev/null || echo "<p>Review content will be converted to HTML. For now, please check the markdown file.</p>")',
                html_content
            )
            
            # Write back
            with open(os.path.join(output_dir, html_file), 'w') as f:
                f.write(new_content)
            
            print(f"Converted: {md_file} → {html_file}")
    
    print("All reviews converted!")

if __name__ == '__main__':
    convert_reviews()
