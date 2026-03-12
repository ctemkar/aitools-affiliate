#!/bin/bash

echo "📝 AI TOOL REVIEW OUTLINE GENERATOR"
echo "==================================="
echo ""
echo "This script helps you quickly create review outlines."
echo ""

read -p "Enter AI tool name: " TOOL_NAME
read -p "Enter monthly price (e.g., 20): " PRICE
read -p "Enter best for (e.g., 'writers, developers'): " BEST_FOR
read -p "Enter rating (1-5): " RATING
read -p "Enter affiliate program URL: " AFFILIATE_URL

OUTLINE_FILE="/Users/chetantemkar/aitools-affiliate/content/reviews/${TOOL_NAME// /-}-outline.md"

cat > "$OUTLINE_FILE" << EOF
# ${TOOL_NAME} Review 2026

## Quick Summary
- **Best for**: ${BEST_FOR}
- **Price**: \$${PRICE}/month
- **Rating**: ${RATING}/5
- **Affiliate Link**: ${AFFILIATE_URL}

## Key Features
1. [Feature 1]
2. [Feature 2]
3. [Feature 3]
4. [Feature 4]
5. [Feature 5]

## Pros & Cons
**✅ Pros:**
- [Pro 1]
- [Pro 2]
- [Pro 3]

**❌ Cons:**
- [Con 1]
- [Con 2]
- [Con 3]

## Pricing Comparison
| Plan | Price | Features |
|------|-------|----------|
| Free | \$0 | [Limited features] |
| Pro | \$${PRICE}/mo | [Standard features] |
| Team | \$[price]/mo | [Collaboration features] |

## How It Compares
- **vs ChatGPT**: [Comparison]
- **vs Claude**: [Comparison]
- **vs [Other Tool]**: [Comparison]

## Getting Started
1. [Step 1]
2. [Step 2]
3. [Step 3]

## Tips for Success
1. [Tip 1]
2. [Tip 2]
3. [Tip 3]

## Final Verdict
[${TOOL_NAME}] is [adjective] for [use case].

**Rating**: ${RATING}/5

**[👉 Get ${TOOL_NAME} Now](${AFFILIATE_URL})**
EOF

echo ""
echo "✅ Outline created: $OUTLINE_FILE"
echo ""
echo "Next steps:"
echo "1. Fill in the [bracketed] sections"
echo "2. Add screenshots to assets/images/"
echo "3. Test the tool yourself"
echo "4. Update with personal experience"
echo ""
echo "Estimated time to complete: 30-60 minutes"