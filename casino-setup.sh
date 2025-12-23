#!/bin/bash
set -eE -o pipefail

# Improved error reporting: trap ERR to print failing command, exit code and line
function error_handler {
  local exit_code=$?
  local failed_cmd="${BASH_COMMAND:-unknown}"
  local failed_line="${BASH_LINENO[0]:-unknown}"
  echo "❌ Script error" >&2
  echo "   Command : $failed_cmd" >&2
  echo "   Exit code: $exit_code" >&2
  echo "   Line    : $failed_line" >&2
  echo "Tip: re-run the script with 'bash -x casino-setup.sh' for a full trace." >&2
  exit $exit_code
}
trap error_handler ERR

############################################
# LOAD CONFIGURATION
############################################
if [ ! -f configuration.properties ]; then
  echo "❌ configuration.properties not found!"
  exit 1
fi

export $(grep -v '^#' configuration.properties | xargs)

echo "🚀 Starting setup for environment: $NODE_ENV"

############################################
# VALIDATION
############################################
REQUIRED_VARS=(
  APP_BASE_DIR BACKEND_ZIP FRONTEND_ZIP
  BACKEND_PORT FRONTEND_PORT
  DB_NAME DB_USER
  SYSTEM_USER NODE_VERSION
)

for VAR in "${REQUIRED_VARS[@]}"; do
  if [ -z "${!VAR}" ]; then
    echo "❌ Missing required config: $VAR"
    exit 1
  fi
done

############################################
# SYSTEM UPDATE & DEPENDENCIES
############################################
echo "📦 Installing system dependencies..."

# Prefer apt (Debian/Ubuntu). If not present, try Homebrew (macOS).
if command -v apt >/dev/null 2>&1; then
  echo "ℹ️ Detected apt (Linux). Installing via apt..."
  sudo apt update -y
  sudo apt install -y curl unzip mysql-server
elif command -v brew >/dev/null 2>&1; then
  echo "ℹ️ Detected Homebrew (macOS). Installing via brew..."
  brew update
  # Install curl/unzip if missing
  if ! command -v curl >/dev/null 2>&1; then
    brew install curl
  fi
  if ! command -v unzip >/dev/null 2>&1; then
    brew install unzip
  fi
  # Install MySQL via brew and start service
  if ! brew list mysql >/dev/null 2>&1; then
    brew install mysql
  fi
  brew services start mysql || true
else
  echo "❌ No supported package manager found (apt or brew)."
  echo "   This script expects Debian/Ubuntu (apt) or macOS with Homebrew (brew)."
  echo "   Please install required dependencies manually: curl, unzip, mysql, node, npm."
  exit 1
fi

############################################
# INSTALL NODE.JS
############################################
if ! command -v node >/dev/null 2>&1; then
  echo "📦 Installing Node.js $NODE_VERSION..."
  curl -fsSL https://deb.nodesource.com/setup_$NODE_VERSION.x | sudo -E bash -
  sudo apt install -y nodejs
fi

############################################
# INSTALL PM2
############################################
if ! command -v pm2 >/dev/null 2>&1; then
  echo "📦 Installing PM2..."
  sudo npm install -g pm2
fi

############################################
# APPLICATION DIRECTORY
############################################
echo "📂 Preparing application directory..."
sudo mkdir -p "$APP_BASE_DIR"
sudo chown -R "$SYSTEM_USER:$SYSTEM_USER" "$APP_BASE_DIR"
cd "$APP_BASE_DIR"

############################################
# UNZIP APPLICATIONS
############################################
echo "📦 Extracting backend and frontend..."
rm -rf backend frontend
unzip -oq "../$BACKEND_ZIP" -d backend
unzip -oq "../$FRONTEND_ZIP" -d frontend

############################################
# MYSQL SETUP (ROOT PASSWORD OPTIONAL)
############################################
echo "🗄️ Configuring MySQL..."

if [ -z "$MYSQL_ROOT_PASSWORD" ]; then
  echo "ℹ️ Using MySQL socket authentication (no root password)"
  MYSQL_CMD="sudo mysql"
else
  echo "ℹ️ Using MySQL root password authentication"
  MYSQL_CMD="mysql -uroot -p$MYSQL_ROOT_PASSWORD"
fi

# Build the password clause for the user
if [ -z "$DB_PASSWORD" ]; then
  PASSWORD_CLAUSE=""
  echo "ℹ️ Creating database user without a password"
else
  PASSWORD_CLAUSE="IDENTIFIED BY '$DB_PASSWORD'"
  echo "ℹ️ Creating database user with password"
fi

$MYSQL_CMD <<EOF
CREATE DATABASE IF NOT EXISTS $DB_NAME;
CREATE USER IF NOT EXISTS '$DB_USER'@'localhost' $PASSWORD_CLAUSE;
GRANT ALL PRIVILEGES ON $DB_NAME.* TO '$DB_USER'@'localhost';
FLUSH PRIVILEGES;
EOF

############################################
# ENV FILES
############################################
echo "⚙️ Creating environment files..."

cat <<EOF > backend/.env.production
NODE_ENV=$NODE_ENV
PORT=$BACKEND_PORT
DATABASE_URL=$BACKEND_DATABASE_URL
JWT_SECRET=$BACKEND_JWT_SECRET
EOF

cat <<EOF > frontend/.env.production
NODE_ENV=$NODE_ENV
PORT=$FRONTEND_PORT
NEXT_PUBLIC_API_URL=$NEXT_PUBLIC_API_URL
EOF

############################################
# BACKEND SETUP (PRISMA)
############################################
echo "🔧 Setting up backend..."
cd "$APP_BASE_DIR/backend"

npm install
npx prisma generate
npx prisma db push

############################################
# PM2 CONFIGURATION
############################################
echo "⚙️ Creating PM2 ecosystem file..."
cd "$APP_BASE_DIR"

cat <<EOF > ecosystem.config.js
module.exports = {
  apps: [
    {
      name: "backend",
      cwd: "$APP_BASE_DIR/backend",
      script: "node_modules/next/dist/bin/next",
      args: "start -p $BACKEND_PORT",
      env: { NODE_ENV: "$NODE_ENV" }
    },
    {
      name: "frontend",
      cwd: "$APP_BASE_DIR/frontend",
      script: "node_modules/next/dist/bin/next",
      args: "start -p $FRONTEND_PORT",
      env: { NODE_ENV: "$NODE_ENV" }
    }
  ]
};
EOF

############################################
# START APPLICATIONS
############################################
echo "▶️ Starting applications..."
pm2 delete backend frontend >/dev/null 2>&1 || true
pm2 start ecosystem.config.js
pm2 save

############################################
# ENABLE PM2 ON BOOT
############################################
if [ "$ENABLE_PM2_STARTUP" = "true" ]; then
  pm2 startup systemd -u "$SYSTEM_USER" --hp "/home/$SYSTEM_USER"
  sudo env PATH=$PATH:/usr/bin pm2 startup systemd -u "$SYSTEM_USER" --hp "/home/$SYSTEM_USER"
fi

############################################
# DONE
############################################
echo "✅ Setup complete!"
echo "🌐 Frontend → port $FRONTEND_PORT"
echo "🔌 Backend  → port $BACKEND_PORT"