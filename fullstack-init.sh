#!/bin/bash
rm -rf .git/ &&
rm -rf .gitignore &&
rm -rf README.md &&
git clone https://github.com/pravosleva/autoru-services-frontend.git frontend &&
git clone https://github.com/pravosleva/autoru-services-backend.git backend &&
yarn --cwd ./backend &&
yarn --cwd ./frontend &&
echo "" &&
echo "===" &&
echo "👉 DEVELOPMENT" &&
echo "  🔥 STEP 1: CHECK ./backend/config/environments/development/database.json" &&
echo "  👌 STEP 2: CHECK ./frontend/.env.development" &&
echo "REACT_APP_API_ENDPOINT=\"http://localhost:3110\"
" > frontend/.env.development &&
echo "  🚀 STEP 3: RUN $ bash dev.sh" &&
echo "===" &&
echo "" &&
echo "👉 PRODUCTION" &&
echo "  👌 STEP 1: CHECK ./frontend/.env.production" &&
echo "REACT_APP_API_ENDPOINT=\"http://localhost:3110\"
" > frontend/.env.production &&
echo "  🔥 STEP 2: CHECK ./ecosystem.config.js" &&
echo "module.exports = {
  apps : [{
    name: 'strapi-autoru-3110',
    cwd: '/home/den/projects/autoru-services/backend',
    script: 'yarn',
    args: 'start',
    env: {
      PORT: '3110',
      NODE_ENV: 'production',
      DATABASE_HOST: 'ds241968.mlab.com', // database Endpoint under 'Connectivity & Security' tab
      DATABASE_PORT: '41968',
      DATABASE_NAME: 'autoru-services', // DB name under 'Configuration' tab
      DATABASE_USERNAME: '<DATABASE_USERNAME>', // default username
      DATABASE_PASSWORD: '<DATABASE_PASSWORD>',
      DATABASE_AUTHENTICATION_DATABASE: 'autoru-services'
    },
  }],
};
" > ecosystem.config.js &&
echo "  🚀 STEP 3: RUN $ bash build.sh" &&
echo "  🚀 STEP 4: RUN $ pm2 start" &&
rm -rf fullstack-init.sh
