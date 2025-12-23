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

# Directory where this script lives (so zip paths are resolved reliably)
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

############################################
# LOAD CONFIGURATION
############################################
if [ ! -f configuration.properties ]; then
  echo "❌ configuration.properties not found!"
  exit 1
fi

export $(grep -v '^#' configuration.properties | xargs)

echo "🚀 Starting setup for environment: $NODE_ENV"

# If APP_BASE_DIR is unset, '.', or the literal 'PWD' (from properties), resolve it to the current working directory
if [ -z "$APP_BASE_DIR" ] || [ "$APP_BASE_DIR" = "." ] || [ "$APP_BASE_DIR" = "PWD" ] || [ "$APP_BASE_DIR" = "\$PWD" ]; then
  APP_BASE_DIR="$PWD"
  echo "ℹ️ APP_BASE_DIR resolved to: $APP_BASE_DIR"
fi

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
PKG_MANAGER=""
if command -v apt >/dev/null 2>&1; then
  PKG_MANAGER="apt"
  echo "ℹ️ Detected apt (Linux). Installing via apt..."
  sudo apt update -y
  sudo apt install -y curl unzip mysql-server
elif command -v brew >/dev/null 2>&1; then
  PKG_MANAGER="brew"
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
  echo "⚠️ No apt or brew detected. Will check if required commands already exist and provide actionable instructions if not."
  # Determine OS for tailored instructions
  UNAME=$(uname -s)
  SUGGEST_INSTALLER=""
  if [ "$UNAME" = "Darwin" ]; then
    SUGGEST_INSTALLER="Homebrew (https://brew.sh)"
  else
    SUGGEST_INSTALLER="apt (Debian/Ubuntu)"
  fi

  # Check required commands and collect missing ones
  MISSING=()
  for cmd in curl unzip mysql node npm; do
    if ! command -v "$cmd" >/dev/null 2>&1; then
      MISSING+=("$cmd")
    fi
  done

  if [ ${#MISSING[@]} -eq 0 ]; then
    echo "ℹ️ All required tools already present: skipping package installation."
  else
    echo "❌ Missing required tools: ${MISSING[*]}"
    echo "   This system doesn't have apt or Homebrew detected."
    echo "   Suggested next steps:"
    if [ "$UNAME" = "Darwin" ]; then
      echo "     1) Install Homebrew:"
      echo "        /bin/bash -c \"\$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)\""
      echo "     2) Then install missing tools: brew install ${MISSING[*]}"
    else
      echo "     1) On Debian/Ubuntu install apt if missing or run as a distro with apt."
      echo "     2) Install missing tools: sudo apt update && sudo apt install -y ${MISSING[*]}"
    fi
    echo "   Alternatively, install these tools manually and re-run the script."
    exit 1
  fi
fi

############################################
# INSTALL NODE.JS
############################################
if ! command -v node >/dev/null 2>&1; then
  echo "📦 Installing Node.js $NODE_VERSION..."
  if [ "$PKG_MANAGER" = "apt" ]; then
    curl -fsSL https://deb.nodesource.com/setup_$NODE_VERSION.x | sudo -E bash -
    sudo apt install -y nodejs
  elif [ "$PKG_MANAGER" = "brew" ]; then
    # Try installing node@<version> via brew, fall back to node
    if brew info "node@${NODE_VERSION}" >/dev/null 2>&1; then
      brew install "node@${NODE_VERSION}" || brew install node
      # attempt to link the versioned node (may require manual steps if permissions differ)
      brew link --force --overwrite "node@${NODE_VERSION}" >/dev/null 2>&1 || true
    else
      brew install node || true
    fi
  else
    echo "⚠️ No supported package manager available to install Node.js."
    echo "   Please install Node.js ${NODE_VERSION} manually and re-run the script."
    exit 1
  fi
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
unzip -oq "$SCRIPT_DIR/$BACKEND_ZIP" -d backend
unzip -oq "$SCRIPT_DIR/$FRONTEND_ZIP" -d frontend

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
# Install backend dependencies only if not already present
if [ -f package.json ]; then
  if [ -d node_modules ]; then
    echo "ℹ️ backend node_modules found, skipping npm install"
  else
    echo "📦 Installing backend dependencies..."
    npm install
  fi
else
  echo "⚠️ backend/package.json not found; skipping npm install"
fi

# Run prisma generate if possible
if command -v npx >/dev/null 2>&1 || [ -d node_modules/.bin ]; then
  echo "🔧 Running prisma generate (if schema present)..."
  npx prisma generate || echo "⚠️ prisma generate failed or not configured"
else
  echo "⚠️ npx or local node_modules not found; skipping prisma generate"
fi
# Determine DB client for checks (use DB credentials from config)
echo "🔍 Checking database schema state..."
if [ -z "$DB_HOST" ]; then DB_HOST=localhost; fi
if [ -z "$DB_PORT" ]; then DB_PORT=3306; fi
if [ -z "$DB_PASSWORD" ]; then
  MYSQL_CLIENT_CMD=(mysql -h"$DB_HOST" -P"$DB_PORT" -u"$DB_USER" -N -s)
  MYSQLDUMP_PWD_FLAG=""
else
  MYSQL_CLIENT_CMD=(mysql -h"$DB_HOST" -P"$DB_PORT" -u"$DB_USER" -p"$DB_PASSWORD" -N -s)
  MYSQLDUMP_PWD_FLAG="-p$DB_PASSWORD"
fi

TABLE_COUNT=$("${MYSQL_CLIENT_CMD[@]}" -e "SELECT COUNT(*) FROM information_schema.tables WHERE table_schema='${DB_NAME}';" 2>/dev/null || echo "-1")

if [ "$TABLE_COUNT" = "-1" ]; then
  echo "⚠️ Could not query information_schema. Ensure database credentials are correct and the DB server is reachable."
  echo "   Attempting a safe 'prisma db push' may still work, but consider fixing connectivity first."
  npx prisma db push
elif [ "$TABLE_COUNT" -eq 0 ]; then
  echo "✅ Database $DB_NAME is empty — applying schema with prisma db push"
  npx prisma db push
else
  echo "⚠️ Database $DB_NAME already contains $TABLE_COUNT table(s). Creating a SQL backup before applying changes."
  BACKUP_FILE="$SCRIPT_DIR/${DB_NAME}_backup_$(date +%Y%m%d_%H%M%S).sql"
  if command -v mysqldump >/dev/null 2>&1; then
    echo "📦 Dumping existing database to $BACKUP_FILE"
    mysqldump -h"$DB_HOST" -P"$DB_PORT" -u"$DB_USER" ${MYSQLDUMP_PWD_FLAG} "$DB_NAME" > "$BACKUP_FILE" 2>/dev/null || echo "⚠️ mysqldump failed — check credentials/permissions"
  else
    echo "⚠️ mysqldump not found — skipping backup. Install mysqldump or ensure you have a backup before proceeding."
  fi

  echo "ℹ️ Applying Prisma schema changes with 'prisma db push' (non-migration, non-destructive by default)."
  echo "   Note: For production, prefer Prisma Migrate for safe, reviewable migrations."
  npx prisma db push || echo "⚠️ 'prisma db push' returned a non-zero exit code — inspect the output above."
fi
# If build artifacts are already present (e.g. Next.js .next), skip building to avoid duplicate work
if [ -d ".next" ] || [ -d "build" ]; then
  echo "ℹ️ Backend build artifacts found, skipping backend build"
else
  if npm run | grep -q "build"; then
    echo "📦 Building backend..."
    npm run build || echo "⚠️ backend build failed"
  else
    echo "ℹ️ No backend build script found; skipping build step."
  fi
fi

############################################
# FRONTEND SETUP
############################################
echo "🔧 Setting up frontend..."
cd "$APP_BASE_DIR/frontend"

if [ -f package.json ]; then
  if [ -d node_modules ]; then
    echo "ℹ️ frontend node_modules found, skipping npm install"
  else
    echo "📦 Installing frontend dependencies..."
    npm install
  fi
  # If build artifacts already exist (Next.js .next or generic build/ directory), skip build
  if [ -d ".next" ] || [ -d "build" ]; then
    echo "ℹ️ Frontend build artifacts found, skipping frontend build"
  else
    if npm run | grep -q "build"; then
      echo "📦 Building frontend..."
      npm run build || echo "⚠️ frontend build failed"
    else
      echo "ℹ️ No build script found in frontend package.json; skipping build step."
    fi
  fi
else
  echo "⚠️ frontend/package.json not found; skipping npm install/build for frontend."
fi

############################################
# PM2 CONFIGURATION
############################################
echo "⚙️ Creating PM2 ecosystem file..."
cd "$APP_BASE_DIR"

cat <<'EOF' > ecosystem.config.js
const path = require('path');

// Use environment variables at runtime to resolve paths. This avoids embedding
// platform-specific path separators into the generated file which can break on
// Windows when APP_BASE_DIR contains backslashes.
module.exports = {
  apps: [
    {
      name: 'backend',
      cwd: path.resolve(process.env.APP_BASE_DIR || __dirname, 'backend'),
      script: 'node_modules/next/dist/bin/next',
      args: `start -p ${process.env.BACKEND_PORT || 3001}`,
      env: { NODE_ENV: process.env.NODE_ENV || 'production' }
    },
    {
      name: 'frontend',
      cwd: path.resolve(process.env.APP_BASE_DIR || __dirname, 'frontend'),
      script: 'node_modules/next/dist/bin/next',
      args: `start -p ${process.env.FRONTEND_PORT || 3000}`,
      env: { NODE_ENV: process.env.NODE_ENV || 'production' }
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
  # Only attempt to register PM2 startup if the init system is supported
  if command -v systemctl >/dev/null 2>&1; then
    echo "ℹ️ Configuring PM2 startup for systemd..."
    pm2 startup systemd -u "$SYSTEM_USER" --hp "/home/$SYSTEM_USER"
    sudo env PATH=$PATH:/usr/bin pm2 startup systemd -u "$SYSTEM_USER" --hp "/home/$SYSTEM_USER"
  elif [ "$(uname -s)" = "Darwin" ]; then
    # macOS uses launchd
    echo "ℹ️ Configuring PM2 startup for launchd (macOS)..."
    pm2 startup launchd -u "$SYSTEM_USER" --hp "/Users/$SYSTEM_USER" || true
  else
    echo "⚠️ PM2 startup not configured: unsupported init system on this platform."
    echo "   Skipping 'pm2 startup' — run the appropriate pm2 startup command manually on this host if you need it."
  fi
fi

############################################
# DONE
############################################
echo "✅ Setup complete!"
echo "🌐 Frontend → port $FRONTEND_PORT"
echo "🔌 Backend  → port $BACKEND_PORT"