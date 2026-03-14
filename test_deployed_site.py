#!/usr/bin/env python3
import subprocess
import json

def test_url(url, description):
    """Test a URL and return status"""
    print(f"Testing: {description}")
    print(f"  URL: {url}")
    
    try:
        # Get HTTP status
        result = subprocess.run(
            ['curl', '-s', '-o', '/dev/null', '-w', '%{http_code}', url],
            capture_output=True,
            text=True,
            timeout=10
        )
        status = result.stdout.strip()
        
        if status == '200':
            # Get page title
            result = subprocess.run(
                ['curl', '-s', url, '|', 'grep', '-o', '\'<title>[^<]*</title>\'', '|', 'head', '-1'],
                shell=True,
                capture_output=True,
                text=True,
                timeout=10
            )
            title = result.stdout.strip() or 'No title found'
            
            print(f"  ✅ Status: {status}")
            print(f"  Title: {title}")
            return True
        else:
            print(f"  ❌ Status: {status}")
            return False
            
    except Exception as e:
        print(f"  ❌ Error: {e}")
        return False

def main():
    print("=== DEPLOYED SITE TEST ===")
    print()
    
    base_url = "https://ctemkar.github.io/aitools-affiliate"
    
    tests = [
        (f"{base_url}/", "Main page"),
        (f"{base_url}/reviews/", "Reviews index"),
        (f"{base_url}/reviews/ChatGPT-review-complete.html", "ChatGPT review"),
        (f"{base_url}/reviews/Midjourney-review-complete.html", "Midjourney review"),
        (f"{base_url}/reviews/Claude-review-complete.html", "Claude review"),
        (f"{base_url}/reviews/GitHub-Copilot-review-complete.html", "GitHub Copilot review"),
        (f"{base_url}/reviews/Stable-Diffusion-review-complete.html", "Stable Diffusion review"),
        (f"{base_url}/reviews/Notion-AI-review-complete.html", "Notion AI review"),
        (f"{base_url}/reviews/Perplexity-AI-review-complete.html", "Perplexity AI review"),
        (f"{base_url}/reviews/Gemini-review-complete.html", "Gemini review"),
        (f"{base_url}/reviews/ElevenLabs-review-complete.html", "ElevenLabs review"),
    ]
    
    passed = 0
    failed = 0
    
    for url, description in tests:
        if test_url(url, description):
            passed += 1
        else:
            failed += 1
        print()
    
    print(f"=== SUMMARY ===")
    print(f"Passed: {passed}/{len(tests)}")
    print(f"Failed: {failed}/{len(tests)}")
    
    if failed == 0:
        print("✅ All tests passed! Site is ready.")
    else:
        print("❌ Some tests failed. Needs fixing.")

if __name__ == '__main__':
    main()
