#!/bin/bash

# Daily Progress Tracker for Cash Earner Project
DATE=$(date +%Y-%m-%d)
PROJECT_DIR="/Users/chetantemkar/aitools-affiliate"
LOG_FILE="$PROJECT_DIR/logs/daily-progress-$DATE.log"

# Create logs directory if it doesn't exist
mkdir -p "$PROJECT_DIR/logs"

echo "=== Cash Earner Daily Progress Report - $DATE ===" > "$LOG_FILE"
echo "" >> "$LOG_FILE"

# Check reviews completed
REVIEWS_COMPLETED=$(find "$PROJECT_DIR/content/reviews" -name "*.md" | wc -l)
echo "📝 Reviews Completed: $REVIEWS_COMPLETED/10" >> "$LOG_FILE"

# Check affiliate links added (simplified check)
AFFILIATE_LINKS=$(grep -r "affiliate\|ref=" "$PROJECT_DIR/content/reviews" | wc -l)
echo "💰 Affiliate Links Added: $AFFILIATE_LINKS" >> "$LOG_FILE"

# Check analytics setup
if [ -f "$PROJECT_DIR/analytics.html" ]; then
    ANALYTICS_STATUS="✅ Set up"
else
    ANALYTICS_STATUS="❌ Not set up"
fi
echo "📊 Analytics: $ANALYTICS_STATUS" >> "$LOG_FILE"

# Check DAILY_TASKS.md
if [ -f "$PROJECT_DIR/DAILY_TASKS.md" ]; then
    TODAY_TASKS=$(grep -c "Task [0-9]:" "$PROJECT_DIR/DAILY_TASKS.md")
    COMPLETED_TASKS=$(grep -c "✅" "$PROJECT_DIR/DAILY_TASKS.md")
    echo "✅ Daily Tasks: $COMPLETED_TASKS/$TODAY_TASKS completed" >> "$LOG_FILE"
else
    echo "⚠️  DAILY_TASKS.md not found" >> "$LOG_FILE"
fi

echo "" >> "$LOG_FILE"
echo "=== Quick Status ===" >> "$LOG_FILE"
echo "- Target: \$100 in 30 days" >> "$LOG_FILE"
echo "- Days remaining: $((30 - $(date +%d)))" >> "$LOG_FILE"
echo "- Daily goal: \$3.33" >> "$LOG_FILE"

# Display the report
cat "$LOG_FILE"

# Send to Discord if configured
if command -v openclaw &> /dev/null; then
    SUMMARY=$(tail -10 "$LOG_FILE")
    openclaw message discord "#research" "📊 Cash Earner Daily Progress:\n$SUMMARY"
fi