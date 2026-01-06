echo "▶️ Starting applications..."
pm2 delete backend frontend >/dev/null 2>&1 || true
pm2 start ecosystem.config.js
pm2 save