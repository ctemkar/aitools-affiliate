#!/bin/bash

echo "🔗 OPENING AFFILIATE PROGRAM LINKS"
echo "=================================="
echo ""
echo "Opening the top 3 affiliate programs in your browser..."
echo ""

# Open Amazon Associates
echo "1. Opening Amazon Associates..."
open "https://affiliate-program.amazon.com" 2>/dev/null || echo "Please visit: https://affiliate-program.amazon.com"

sleep 2

# Open ClickBank
echo "2. Opening ClickBank..."
open "https://www.clickbank.com" 2>/dev/null || echo "Please visit: https://www.clickbank.com"

sleep 2

# Open OpenAI affiliate page
echo "3. Opening OpenAI affiliate program..."
open "https://openai.com/affiliate-program" 2>/dev/null || echo "Please visit: https://openai.com/affiliate-program"

echo ""
echo "✅ All links opened!"
echo ""
echo "📝 Signup Instructions:"
echo "1. Create accounts on each site"
echo "2. Use website: https://aitools.lovehappyhours.com"
echo "3. Describe: 'AI tools review and recommendation site'"
echo "4. Save your affiliate IDs"
echo "5. Update tracking.csv with your info"
echo ""
echo "⏰ Estimated time: 30 minutes"
echo "🎯 Goal: Complete all 3 signups today"