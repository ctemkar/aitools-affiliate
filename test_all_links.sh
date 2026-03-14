#!/bin/bash

echo "=== COMPREHENSIVE LINK TEST ==="
echo ""

URLS=(
    "https://ctemkar.github.io/aitools-affiliate/"
    "https://ctemkar.github.io/aitools-affiliate/reviews/"
    "https://ctemkar.github.io/aitools-affiliate/reviews/ChatGPT-review-complete.html"
    "https://ctemkar.github.io/aitools-affiliate/reviews/Midjourney-review-complete.html"
    "https://ctemkar.github.io/aitools-affiliate/reviews/Claude-review-complete.html"
    "https://ctemkar.github.io/aitools-affiliate/reviews/GitHub-Copilot-review-complete.html"
    "https://ctemkar.github.io/aitools-affiliate/reviews/Stable-Diffusion-review-complete.html"
    "https://ctemkar.github.io/aitools-affiliate/reviews/Notion-review-complete.html"
    "https://ctemkar.github.io/aitools-affiliate/reviews/Perplexity-AI-review-complete.html"
    "https://ctemkar.github.io/aitools-affiliate/reviews/Gemini-review-complete.html"
    "https://ctemkar.github.io/aitools-affiliate/reviews/ElevenLabs-review-complete.html"
)

for url in "${URLS[@]}"; do
    status=$(curl -s -o /dev/null -w "%{http_code}" "$url")
    if [ "$status" -eq 200 ]; then
        echo "✅ $url"
    else
        echo "❌ $url (Status: $status)"
    fi
done

echo ""
echo "=== CONTENT CHECK ==="
echo ""

# Check a few key pages for actual content
check_page() {
    local url=$1
    local name=$2
    local content=$(curl -s "$url")
    
    if echo "$content" | grep -q "<p>"; then
        echo "✅ $name has paragraph content"
    else
        echo "❌ $name has NO paragraph content"
    fi
    
    if echo "$content" | grep -q "pandoc\|Review content will be converted"; then
        echo "❌ $name has placeholder text"
    else
        echo "✅ $name has no placeholder text"
    fi
}

check_page "https://ctemkar.github.io/aitools-affiliate/reviews/ChatGPT-review-complete.html" "ChatGPT Review"
check_page "https://ctemkar.github.io/aitools-affiliate/reviews/Midjourney-review-complete.html" "Midjourney Review"
check_page "https://ctemkar.github.io/aitools-affiliate/reviews/Claude-review-complete.html" "Claude Review"

echo ""
echo "=== TEST COMPLETE ==="
