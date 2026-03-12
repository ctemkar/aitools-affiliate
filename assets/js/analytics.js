// Google Analytics Tracking Code
// Replace G-XXXXXXXXXX with your actual Measurement ID

(function() {
  // Create analytics placeholder
  const analyticsPlaceholder = `
<!-- Google Analytics Placeholder -->
<!-- 
  TO SET UP:
  1. Go to https://analytics.google.com/
  2. Create new property: "AI Tools Affiliate"
  3. Get Measurement ID (starts with G-)
  4. Replace G-XXXXXXXXXX below with your ID
  5. Remove these comment lines
-->

<!-- 
<script async src="https://www.googletagmanager.com/gtag/js?id=G-XXXXXXXXXX"></script>
<script>
  window.dataLayer = window.dataLayer || [];
  function gtag(){dataLayer.push(arguments);}
  gtag('js', new Date());
  gtag('config', 'G-XXXXXXXXXX');
  
  // Track affiliate link clicks
  document.addEventListener('click', function(e) {
    if (e.target.matches('a[href*="affiliate"]') || e.target.closest('a[href*="affiliate"]')) {
      gtag('event', 'affiliate_click', {
        'event_category': 'affiliate',
        'event_label': e.target.href
      });
    }
  });
</script>
-->
`;

  // Add to head if not already present
  if (!document.querySelector('script[src*="googletagmanager"]')) {
    const head = document.head || document.getElementsByTagName('head')[0];
    const div = document.createElement('div');
    div.innerHTML = analyticsPlaceholder;
    head.appendChild(div);
  }
})();