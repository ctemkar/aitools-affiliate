#!/bin/bash

echo "📊 Setting up Google Analytics for AI Tools Affiliate Site"
echo "=========================================================="

# Create analytics tracking code
cat > analytics.html << 'ANALYTICS'
<!-- Google Analytics -->
<script async src="https://www.googletagmanager.com/gtag/js?id=G-XXXXXXXXXX"></script>
<script>
  window.dataLayer = window.dataLayer || [];
  function gtag(){dataLayer.push(arguments);}
  gtag('js', new Date());
  gtag('config', 'G-XXXXXXXXXX');
</script>
<!-- End Google Analytics -->
ANALYTICS

echo "✅ Created analytics template file: analytics.html"
echo ""
echo "📝 NEXT STEPS:"
echo "1. Go to https://analytics.google.com/"
echo "2. Create a new property for 'AI Tools Affiliate'"
echo "3. Get your Measurement ID (starts with G-)"
echo "4. Replace G-XXXXXXXXXX in analytics.html with your ID"
echo "5. Add analytics.html to your site's header"
echo ""
echo "🔗 Quick Links:"
echo "- Google Analytics: https://analytics.google.com/"
echo "- GA4 Setup Guide: https://support.google.com/analytics/answer/9304153"
echo "- Affiliate Tracking: Consider using https://www.postaffiliatepro.com/ for advanced tracking"
