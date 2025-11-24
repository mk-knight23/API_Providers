#!/bin/bash

echo "🚀 AI API Providers - Deployment Script"
echo "========================================"
echo ""

# Check if git is initialized
if [ ! -d .git ]; then
    echo "❌ Git not initialized. Run: git init"
    exit 1
fi

# Build the project
echo "📦 Building project..."
npm run build

if [ $? -ne 0 ]; then
    echo "❌ Build failed. Fix errors and try again."
    exit 1
fi

echo "✅ Build successful!"
echo ""

# Check if vercel CLI is installed
if ! command -v vercel &> /dev/null; then
    echo "⚠️  Vercel CLI not found."
    echo "Install with: npm i -g vercel"
    echo ""
    echo "Or deploy via GitHub:"
    echo "1. Create repo on GitHub"
    echo "2. git remote add origin YOUR_REPO_URL"
    echo "3. git push -u origin main"
    echo "4. Import on vercel.com"
    exit 0
fi

# Deploy to Vercel
echo "🚀 Deploying to Vercel..."
vercel --prod

echo ""
echo "✅ Deployment complete!"
echo "🌐 Your site is live!"
