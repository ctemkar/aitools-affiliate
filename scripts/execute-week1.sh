#!/bin/bash

echo "🚀 WEEK 1 EXECUTION SCRIPT - AI TOOLS AFFILIATE"
echo "================================================"
echo "Date: $(date '+%Y-%m-%d %H:%M')"
echo "Time Zone: Asia/Bangkok (GMT+7)"
echo ""

echo "📊 CURRENT STATUS"
echo "-----------------"
echo "✅ Site: https://ctemkar.github.io/aitools-affiliate/"
echo "✅ Reviews: 8/10 complete"
echo "✅ Google Analytics: ID G-RN3WD41VM3 (added)"
echo "❌ Twitter: Not created"
echo "❌ ConvertKit: Not created"
echo "❌ Traffic: 0/50 visitors"
echo ""

echo "🎯 TODAY'S GOAL: Complete 3 high-priority tasks"
echo "-----------------------------------------------"
echo "1. Twitter Account Creation (10 min)"
echo "2. ConvertKit Setup (10 min)"
echo "3. First Traffic Generation (15 min)"
echo "Total: 35 minutes"
echo ""

echo "🐦 TASK 1: CREATE TWITTER ACCOUNT"
echo "----------------------------------"
echo "Time: 10 minutes"
echo "Script: ./scripts/create-twitter-account.sh"
echo "Status: READY TO EXECUTE"
echo ""
read -p "Press Enter to view Twitter setup instructions..."
./scripts/create-twitter-account.sh
echo ""
read -p "Have you created the Twitter account? (y/n): " twitter_done
if [ "$twitter_done" = "y" ]; then
    echo "✅ Twitter account created!"
else
    echo "⚠️  Twitter account pending. Continue anyway? (y/n): "
    read continue_twitter
    if [ "$continue_twitter" != "y" ]; then
        echo "Exiting. Run this script again when ready."
        exit 1
    fi
fi
echo ""

echo "📧 TASK 2: SET UP CONVERTKIT"
echo "-----------------------------"
echo "Time: 10 minutes"
echo "Script: ./scripts/setup-convertkit.sh"
echo "Status: READY TO EXECUTE"
echo ""
read -p "Press Enter to view ConvertKit setup instructions..."
./scripts/setup-convertkit.sh
echo ""
read -p "Have you set up ConvertKit? (y/n): " convertkit_done
if [ "$convertkit_done" = "y" ]; then
    echo "✅ ConvertKit set up!"
else
    echo "⚠️  ConvertKit pending. Continue anyway? (y/n): "
    read continue_convertkit
    if [ "$continue_convertkit" != "y" ]; then
        echo "Exiting. Run this script again when ready."
        exit 1
    fi
fi
echo ""

echo "🚀 TASK 3: GENERATE FIRST TRAFFIC"
echo "---------------------------------"
echo "Time: 15 minutes"
echo "Script: ./scripts/traffic-generation.sh"
echo "Status: READY TO EXECUTE"
echo ""
read -p "Press Enter to view traffic generation instructions..."
./scripts/traffic-generation.sh
echo ""
echo "📝 QUICK TRAFFIC ACTIONS:"
echo "1. Share site with 5 friends/colleagues"
echo "2. Post on personal social media"
echo "3. Comment on 2 AI-related blogs/forums"
echo "4. Submit to 1 AI tool directory"
echo ""
read -p "Have you generated initial traffic? (y/n): " traffic_done
if [ "$traffic_done" = "y" ]; then
    echo "✅ Initial traffic generated!"
else
    echo "⚠️  Traffic generation pending."
fi
echo ""

echo "📈 UPDATE STATUS BOARD"
echo "----------------------"
echo "Updating Kanban board and dashboard..."
./status-terminal.sh
echo ""
echo "🌐 View web dashboard:"
echo "https://ctemkar.github.io/aitools-affiliate/status-dashboard.html"
echo ""
echo "📊 View detailed Kanban:"
echo "cat KANBAN_STATUS.md"
echo ""

echo "🎯 WEEK 1 PROGRESS SUMMARY"
echo "---------------------------"
echo "✅ Google Analytics: COMPLETE"
echo "✅ Twitter Account: $(if [ "$twitter_done" = "y" ]; then echo "COMPLETE"; else echo "PENDING"; fi)"
echo "✅ ConvertKit: $(if [ "$convertkit_done" = "y" ]; then echo "COMPLETE"; else echo "PENDING"; fi)"
echo "✅ Initial Traffic: $(if [ "$traffic_done" = "y" ]; then echo "GENERATED"; else echo "PENDING"; fi)"
echo "✅ Reviews: 8/10 (80%)"
echo ""
echo "⏰ TIME CHECK: $(date '+%H:%M')"
echo "Estimated completion: $(date -v+35M '+%H:%M')"
echo ""

echo "🚀 NEXT STEPS FOR TOMORROW (March 13)"
echo "--------------------------------------"
echo "1. Check Google Analytics for traffic"
echo "2. Create LinkedIn Company Page"
echo "3. Design profile graphics (Canva)"
echo "4. Write 2 more reviews (Gemini, Copilot)"
echo "5. Set up Google Search Console"
echo ""

echo "💰 AFFILIATE PROGRAM TIMELINE"
echo "------------------------------"
echo "Week 1 (Now): Build foundation"
echo "Week 2: Apply for easy programs (ShareASale, ClickBank)"
echo "Week 3: Apply for medium programs (Notion, GitHub)"
echo "Week 4: Apply for premium programs (OpenAI, Anthropic)"
echo "Month 2: First affiliate earnings target"
echo ""

echo "🎉 EXECUTION COMPLETE!"
echo "----------------------"
echo "Run this script anytime: ./scripts/execute-week1.sh"
echo "Check status anytime: ./status-terminal.sh"
echo "View dashboard: open status-dashboard.html"
echo ""
echo "Remember: Consistency > Perfection"
echo "Small daily actions compound into big results."