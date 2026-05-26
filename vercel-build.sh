#!/bin/bash

# Exit immediately if a command exits with a non-zero status
set -e

echo "🚀 Starting custom Vercel build for Flutter Web..."

# 1. Clone Flutter SDK stable branch (shallow clone for maximum speed)
echo "📥 Cloning Flutter SDK (stable branch)..."
git clone https://github.com/flutter/flutter.git -b stable --depth 1

# 2. Add Flutter to path
echo "⚙️ Setting up PATH..."
export PATH="$PATH:$(pwd)/flutter/bin"

# 3. Print flutter version to verify
echo "🔍 Verifying Flutter Installation..."
flutter --version

# 4. Disable analytics and enable web
echo "🛠️ Configuring Flutter for Web..."
flutter config --no-analytics
flutter config --enable-web

# 5. Build the web app in release mode
echo "📦 Building Flutter Web App..."
flutter build web --release

echo "✅ Build completed successfully! Output is in build/web"
