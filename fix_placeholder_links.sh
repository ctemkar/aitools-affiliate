#!/bin/bash

# Fix all placeholder affiliate links with actual tool URLs (non-affiliate for now)

echo "Fixing placeholder links in all files..."

# ChatGPT links
find . -name "*.md" -o -name "*.html" | xargs sed -i '' 's|\[YOUR_CHATGPT_AFFILIATE_LINK\]|https://chat.openai.com|g' 2>/dev/null
find . -name "*.md" -o -name "*.html" | xargs sed -i '' 's|your-affiliate-link|https://chat.openai.com|g' 2>/dev/null
find . -name "*.md" -o -name "*.html" | xargs sed -i '' 's|Your ChatGPT affiliate link here|https://chat.openai.com|g' 2>/dev/null

# Midjourney links
find . -name "*.md" -o -name "*.html" | xargs sed -i '' 's|\[YOUR_MIDJOURNEY_AFFILIATE_LINK\]|https://www.midjourney.com|g' 2>/dev/null
find . -name "*.md" -o -name "*.html" | xargs sed -i '' 's|Your Midjourney affiliate link here|https://www.midjourney.com|g' 2>/dev/null

# Claude links
find . -name "*.md" -o -name "*.html" | xargs sed -i '' 's|\[YOUR_CLAUDE_AFFILIATE_LINK\]|https://www.anthropic.com/claude|g' 2>/dev/null
find . -name "*.md" -o -name "*.html" | xargs sed -i '' 's|Your Claude affiliate link here|https://www.anthropic.com/claude|g' 2>/dev/null

# Copilot links
find . -name "*.md" -o -name "*.html" | xargs sed -i '' 's|\[YOUR_COPILOT_AFFILIATE_LINK\]|https://github.com/features/copilot|g' 2>/dev/null
find . -name "*.md" -o -name "*.html" | xargs sed -i '' 's|Your GitHub Copilot affiliate link here|https://github.com/features/copilot|g' 2>/dev/null

# Other tools
find . -name "*.md" -o -name "*.html" | xargs sed -i '' 's|Your Stable Diffusion hosting affiliate link here|https://stability.ai|g' 2>/dev/null
find . -name "*.md" -o -name "*.html" | xargs sed -i '' 's|Your Notion affiliate link here|https://www.notion.so|g' 2>/dev/null
find . -name "*.md" -o -name "*.html" | xargs sed -i '' 's|Your Perplexity AI affiliate link here|https://www.perplexity.ai|g' 2>/dev/null

echo "Done! All placeholder links replaced with actual tool URLs."
echo ""
echo "Remember: These are NON-AFFILIATE links for now."
echo "We'll replace them with real affiliate links in Week 2 after getting traffic proof."
