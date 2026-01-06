#!/bin/bash
echo "📂 Preparing application directory..."
rm -rf backend
rm -rf frontend

#Fetch Latest Data
echo "📂 Fetching latest data"
git pull

#Extract Backend codebase
echo "📦 Extracting Backend codebase"
unzip -oq backend.zip -d backend

echo "📦 Extracting Frontend codebase"
#Extract Frontend codebase
unzip -oq frontend.zip -d frontend

# Setup Backend codebase and infra
echo "🔧 Setting up Backend codebase and infra"
cd backend
echo "📦 Installing Backend dependencies..."
npm install
npx prisma generate

# Setup Frontend codebase and infra
echo "🔧 Setting up Frontend codebase and infra"
cd ../frontend
echo "📦 Installing Frontend dependencies..."
npm install

############################################
# START APPLICATIONS
############################################
echo "▶️ Starting applications..."
cd ..
pm2 delete backend frontend >/dev/null 2>&1 || true
pm2 start ecosystem.config.js
pm2 save