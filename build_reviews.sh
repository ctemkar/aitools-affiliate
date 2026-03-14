#!/bin/bash

# Build HTML pages from markdown reviews
echo "Building HTML pages from markdown reviews..."

# Create reviews directory if it doesn't exist
mkdir -p reviews

# Create index page for all reviews
cat > reviews/index.html << 'HTML_EOF'
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>AI Tools Reviews - aitools.lovehappyhours.com</title>
    <link rel="stylesheet" href="../style.css">
    <style>
        .reviews-container {
            max-width: 1200px;
            margin: 0 auto;
            padding: 40px 20px;
        }
        
        .reviews-header {
            text-align: center;
            margin-bottom: 50px;
        }
        
        .reviews-header h1 {
            font-size: 2.5rem;
            margin-bottom: 20px;
            color: #333;
        }
        
        .reviews-header p {
            font-size: 1.2rem;
            color: #666;
            max-width: 800px;
            margin: 0 auto;
        }
        
        .reviews-grid {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(350px, 1fr));
            gap: 30px;
        }
        
        .review-card {
            background: white;
            border-radius: 15px;
            padding: 30px;
            box-shadow: 0 10px 30px rgba(0,0,0,0.1);
            transition: transform 0.3s ease;
        }
        
        .review-card:hover {
            transform: translateY(-5px);
        }
        
        .review-title {
            font-size: 1.5rem;
            margin-bottom: 15px;
            color: #333;
        }
        
        .review-meta {
            color: #666;
            font-size: 0.9rem;
            margin-bottom: 20px;
        }
        
        .review-excerpt {
            color: #555;
            line-height: 1.6;
            margin-bottom: 25px;
        }
        
        .read-more {
            display: inline-block;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            color: white;
            padding: 12px 25px;
            border-radius: 8px;
            text-decoration: none;
            font-weight: 600;
            transition: opacity 0.3s ease;
        }
        
        .read-more:hover {
            opacity: 0.9;
        }
        
        .back-home {
            display: inline-block;
            margin-top: 40px;
            color: #667eea;
            text-decoration: none;
            font-weight: 600;
        }
    </style>
</head>
<body>
    <div class="reviews-container">
        <div class="reviews-header">
            <h1>AI Tools Reviews</h1>
            <p>In-depth analysis and comparisons of the best AI tools for developers, designers, and creators. Our team tests each tool thoroughly to bring you honest, actionable insights.</p>
        </div>
        
        <div class="reviews-grid">
HTML_EOF

# Process each review
for review in content/reviews/*-complete.md; do
    if [ -f "$review" ]; then
        # Extract tool name from filename
        tool_name=$(basename "$review" | sed 's/-review-complete\.md//' | sed 's/-/ /g')
        
        # Get first paragraph as excerpt
        excerpt=$(head -n 10 "$review" | grep -v "^#" | grep -v "^$" | head -n 3 | tr '\n' ' ' | sed 's/  / /g' | cut -c1-200)
        
        # Create HTML filename
        html_file="reviews/$(basename "$review" .md).html"
        
        # Add to index
        cat >> reviews/index.html << HTML_EOF
            <div class="review-card">
                <h2 class="review-title">${tool_name} Review</h2>
                <div class="review-meta">Complete Analysis & Rating</div>
                <p class="review-excerpt">${excerpt}...</p>
                <a href="$(basename "$html_file")" class="read-more">Read Full Review →</a>
            </div>
HTML_EOF
        
        # Create individual review page
        cat > "$html_file" << PAGE_EOF
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>${tool_name} Review - aitools.lovehappyhours.com</title>
    <link rel="stylesheet" href="../style.css">
    <style>
        .review-container {
            max-width: 800px;
            margin: 0 auto;
            padding: 40px 20px;
        }
        
        .review-header {
            margin-bottom: 40px;
        }
        
        .review-header h1 {
            font-size: 2.5rem;
            margin-bottom: 10px;
            color: #333;
        }
        
        .review-meta {
            color: #666;
            font-size: 1rem;
            margin-bottom: 30px;
        }
        
        .review-content {
            line-height: 1.8;
            color: #444;
            font-size: 1.1rem;
        }
        
        .review-content h2 {
            margin-top: 40px;
            margin-bottom: 20px;
            color: #333;
        }
        
        .review-content h3 {
            margin-top: 30px;
            margin-bottom: 15px;
            color: #444;
        }
        
        .review-content p {
            margin-bottom: 20px;
        }
        
        .review-content ul, .review-content ol {
            margin-bottom: 20px;
            padding-left: 20px;
        }
        
        .review-content li {
            margin-bottom: 10px;
        }
        
        .cta-section {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            color: white;
            padding: 40px;
            border-radius: 15px;
            margin: 50px 0;
            text-align: center;
        }
        
        .cta-section h2 {
            color: white;
            margin-bottom: 20px;
        }
        
        .cta-button {
            display: inline-block;
            background: white;
            color: #667eea;
            padding: 15px 30px;
            border-radius: 8px;
            text-decoration: none;
            font-weight: 600;
            font-size: 1.1rem;
            margin-top: 20px;
        }
        
        .back-link {
            display: inline-block;
            margin-top: 40px;
            color: #667eea;
            text-decoration: none;
            font-weight: 600;
        }
    </style>
</head>
<body>
    <div class="review-container">
        <div class="review-header">
            <h1>${tool_name} Review</h1>
            <div class="review-meta">Complete Analysis & Rating</div>
        </div>
        
        <div class="review-content">
            $(pandoc -f markdown -t html "$review" 2>/dev/null || echo "<p>Review content will be converted to HTML. For now, please check the markdown file.</p>")
        </div>
        
        <div class="cta-section">
            <h2>Ready to try ${tool_name}?</h2>
            <p>Get started with the best AI tools for your workflow.</p>
            <a href="../index.html#${tool_name// /-}" class="cta-button">Visit ${tool_name} →</a>
        </div>
        
        <a href="index.html" class="back-link">← Back to All Reviews</a>
    </div>
</body>
</html>
PAGE_EOF
    fi
done

# Close index.html
cat >> reviews/index.html << 'HTML_EOF'
        </div>
        
        <a href="../index.html" class="back-home">← Back to Home</a>
    </div>
</body>
</html>
HTML_EOF

echo "Done! Built $(ls content/reviews/*-complete.md | wc -l) review pages."
echo "Access at: https://ctemkar.github.io/aitools-affiliate/reviews/"
