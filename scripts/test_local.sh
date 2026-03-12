#!/bin/bash

echo "🌐 TESTING AI TOOLS SITE LOCALLY"
echo "================================"
echo ""

echo "1. Starting local web server..."
echo "   Visit: http://localhost:8000"
echo "   Press Ctrl+C to stop"
echo ""

# Check if Python 3 is available
if command -v python3 &> /dev/null; then
    echo "Starting Python HTTP server..."
    python3 -m http.server 8000
elif command -v python &> /dev/null; then
    echo "Starting Python HTTP server..."
    python -m SimpleHTTPServer 8000
else
    echo "Python not found. Trying alternative methods..."
    
    # Try Node.js
    if command -v node &> /dev/null; then
        echo "Starting Node.js server..."
        npx serve -p 8000
    else
        echo "No server found. Please install Python or Node.js."
        echo "Or open index.html directly in your browser."
    fi
fi