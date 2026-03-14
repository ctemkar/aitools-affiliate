#!/usr/bin/env python3
import os

# Map of tool names to their correct URLs
TOOL_URLS = {
    "ChatGPT": "https://openai.com/chatgpt/pricing",
    "Midjourney": "https://www.midjourney.com/account/plan/",
    "Claude": "https://www.anthropic.com/claude/pro",
    "GitHub-Copilot": "https://github.com/features/copilot#pricing",
    "Stable-Diffusion": "https://stability.ai/membership",
    "Notion-AI": "https://www.notion.so/product/ai",
    "Perplexity-AI": "https://www.perplexity.ai/pro",
    "Gemini": "https://gemini.google.com/upgrade",
    "ElevenLabs": "https://elevenlabs.io/subscription"
}

def fix_review_file(filepath, tool_name):
    """Fix the Visit [Tool] link in a review HTML file"""
    with open(filepath, 'r') as f:
        content = f.read()
    
    # Find and replace the incorrect link
    old_link = f'href="../index.html#{tool_name}"'
    new_link = f'href="{TOOL_URLS[tool_name]}"'
    
    if old_link in content:
        content = content.replace(old_link, new_link)
        print(f"  Fixed {tool_name}: {old_link} → {new_link}")
    else:
        # Try alternative pattern
        old_link2 = f'href="../index.html"'
        if old_link2 in content:
            content = content.replace(old_link2, new_link)
            print(f"  Fixed {tool_name} (alt): {old_link2} → {new_link}")
        else:
            print(f"  ❌ Could not find link pattern for {tool_name}")
    
    # Write back
    with open(filepath, 'w') as f:
        f.write(content)

def main():
    print("Fixing review page links...")
    
    for html_file in os.listdir('reviews'):
        if html_file.endswith('-complete.html'):
            # Extract tool name from filename
            tool_name = html_file.replace('-review-complete.html', '')
            
            if tool_name in TOOL_URLS:
                filepath = os.path.join('reviews', html_file)
                fix_review_file(filepath, tool_name)
            else:
                print(f"  ⚠️ No URL mapping for {tool_name}")
    
    print("\n✅ All review page links fixed!")

if __name__ == '__main__':
    main()
