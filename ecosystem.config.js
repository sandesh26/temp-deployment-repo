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
      args: `start -p 3001}`,
      env: { NODE_ENV: process.env.NODE_ENV || 'production' }
    },
    {
      name: 'frontend',
      cwd: path.resolve(process.env.APP_BASE_DIR || __dirname, 'frontend'),
      script: 'node_modules/next/dist/bin/next',
      args: `start -p 3000}`,
      env: { NODE_ENV: process.env.NODE_ENV || 'production' }
    }
  ]
};