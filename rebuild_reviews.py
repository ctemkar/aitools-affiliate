#!/usr/bin/env python3
import os
import re

def read_markdown(filepath):
    """Read markdown file and convert basic formatting"""
    with open(filepath, 'r') as f:
        content = f.read()
    
    # Simple markdown to HTML conversion
    content = re.sub(r'^# (.*?)$', r'<h1>\1</h1>', content, flags=re.MULTILINE)
    content = re.sub(r'^## (.*?)$', r'<h2>\1</h2>', content, flags=re.MULTILINE)
    content = re.sub(r'^### (.*?)$', r'<h3>\1</h3>', content, flags=re.MULTILINE)
    
    # Convert paragraphs
    lines = content.split('\n')
    html_lines = []
    
    for line in lines:
        line = line.strip()
        if line.startswith('<h') or line == '':
            html_lines.append(line)
        elif line:
            # Check if it's a list item
            if line.startswith('- '):
                html_lines.append(f'<li>{line[2:]}</li>')
            else:
                html_lines.append(f'<p>{line}</p>')
    
    return '\n'.join(html_lines)

def create_review_html(tool_name, markdown_content):
    """Create complete HTML review page"""
    tool_name_display = tool_name.replace('-', ' ').title()
    
    return f'''<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>{tool_name_display} Review - AI Tools Reviews</title>
    <link rel="stylesheet" href="../style.css">
    <style>
        .review-container {{
            max-width: 800px;
            margin: 0 auto;
            padding: 40px 20px;
        }}
        
        .review-header {{
            margin-bottom: 40px;
        }}
        
        .review-header h1 {{
            font-size: 2.5rem;
            margin-bottom: 10px;
            color: #333;
        }}
        
        .review-meta {{
            color: #666;
            font-size: 1rem;
            margin-bottom: 30px;
        }}
        
        .review-content {{
            line-height: 1.8;
            color: #444;
            font-size: 1.1rem;
        }}
        
        .review-content h2 {{
            margin-top: 40px;
            margin-bottom: 20px;
            color: #333;
        }}
        
        .review-content h3 {{
            margin-top: 30px;
            margin-bottom: 15px;
            color: #444;
        }}
        
        .review-content p {{
            margin-bottom: 20px;
        }}
        
        .review-content ul, .review-content ol {{
            margin-bottom: 20px;
            padding-left: 20px;
        }}
        
        .review-content li {{
            margin-bottom: 10px;
        }}
        
        .cta-section {{
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            color: white;
            padding: 40px;
            border-radius: 15px;
            margin: 50px 0;
            text-align: center;
        }}
        
        .cta-section h2 {{
            color: white;
            margin-bottom: 20px;
        }}
        
        .cta-button {{
            display: inline-block;
            background: white;
            color: #667eea;
            padding: 15px 30px;
            border-radius: 8px;
            text-decoration: none;
            font-weight: 600;
            font-size: 1.1rem;
            margin-top: 20px;
        }}
        
        .back-link {{
            display: inline-block;
            margin-top: 40px;
            color: #667eea;
            text-decoration: none;
            font-weight: 600;
        }}
    </style>
</head>
<body>
    <div class="review-container">
        <div class="review-header">
            <h1>{tool_name_display} Review</h1>
            <div class="review-meta">Complete Analysis & Rating</div>
        </div>
        
        <div class="review-content">
            {markdown_content}
        </div>
        
        <div class="cta-section">
            <h2>Ready to try {tool_name_display}?</h2>
            <p>Get started with the best AI tools for your workflow.</p>
            <a href="../index.html#{tool_name}" class="cta-button">Visit {tool_name_display} →</a>
        </div>
        
        <a href="index.html" class="back-link">← Back to All Reviews</a>
    </div>
</body>
</html>'''

def main():
    # Create reviews directory
    os.makedirs('reviews', exist_ok=True)
    
    # Process each markdown review
    for md_file in os.listdir('content/reviews'):
        if md_file.endswith('-complete.md'):
            tool_name = md_file.replace('-review-complete.md', '')
            
            print(f"Processing: {tool_name}")
            
            # Read and convert markdown
            md_path = os.path.join('content/reviews', md_file)
            html_content = read_markdown(md_path)
            
            # Create HTML file
            html_file = md_file.replace('.md', '.html')
            html_path = os.path.join('reviews', html_file)
            
            with open(html_path, 'w') as f:
                f.write(create_review_html(tool_name, html_content))
            
            print(f"  Created: {html_file}")
    
    print(f"\nDone! Created {len(os.listdir('reviews'))} review pages.")

if __name__ == '__main__':
    main()
