#!/bin/bash
rm -rf .git/ &&
rm -rf .gitignore &&
rm -rf README.md &&
git clone https://github.com/pravosleva/autoru-services-frontend.git frontend &&
yarn --cwd ./frontend &&
git clone https://github.com/pravosleva/autoru-services-backend.git backend &&
yarn --cwd ./backend &&
echo "" &&
echo "===" &&
echo "" &&
echo "  DEVELOPMENT" &&
echo "" &&
echo "👉 CHECK THIS BEFORE START:" &&
echo "  🔥 STEP 1: ./frontend/.env.development" &&
echo "REACT_APP_API_ENDPOINT=\"http://localhost:3110\"
" > frontend/.env.development &&
echo "  🔥 STEP 2: ./ecosystem.dev.config.js" &&
echo "module.exports = {
  apps : [{
    name: 'strapi-autoru-3110',
    cwd: '/home/den/projects/autoru-services/backend', // ATTENTION!
    script: 'yarn',
    args: 'start',
    interpreter: 'none',
    env: {
      NODE_ENV: 'development',
      PORT: '3110',
      DATABASE_HOST: 'ds053295.mlab.com', // database Endpoint under 'Connectivity & Security' tab
      DATABASE_PORT: '53295',
      DATABASE_NAME: 'autoru-autoservices', // DB name under 'Configuration' tab
      DATABASE_USERNAME: '<DATABASE_USERNAME>', // default username
      DATABASE_PASSWORD: '<DATABASE_PASSWORD>',
      DATABASE_AUTHENTICATION_DATABASE: 'autoru-autoservices'
    }
  }],
};
" > ecosystem.dev.config.js &&
echo "" &&
echo "  🚀 WAY 1: $ pm2 start ecosystem.dev.config.js" &&
echo "  🚀 WAY 2: $ bash dev.sh" &&
echo "" &&
echo "===" &&
echo "" &&
echo "  PRODUCTION" &&
echo "" &&
echo "👉 CHECK THIS BEFORE START:" &&
echo "  🔥 STEP 1: ./frontend/.env.production" &&
echo "REACT_APP_API_ENDPOINT=\"http://selection4test.ru:3110\"
" > frontend/.env.production &&
echo "  🔥 STEP 2: ./ecosystem.prod.config.js" &&
echo "module.exports = {
  apps : [{
    name: 'strapi-autoru-3110',
    cwd: '/home/den/projects/autoru-services/backend', // ATTENTION!
    script: 'yarn',
    args: 'start',
    interpreter: 'none',
    env: {
      NODE_ENV: 'production',
      PORT: '3110',
      DATABASE_HOST: 'ds053295.mlab.com', // database Endpoint under 'Connectivity & Security' tab
      DATABASE_PORT: '53295',
      DATABASE_NAME: 'autoru-autoservices', // DB name under 'Configuration' tab
      DATABASE_USERNAME: '<DATABASE_USERNAME>', // default username
      DATABASE_PASSWORD: '<DATABASE_PASSWORD>',
      DATABASE_AUTHENTICATION_DATABASE: 'autoru-autoservices'
    }
  }],
};
" > ecosystem.prod.config.js &&
echo "" &&
echo "  🚀 $ bash build.sh" &&
echo "  🚀 $ pm2 start ecosystem.prod.config.js" &&
echo "" &&
echo "===" # && rm -rf fullstack-init.sh
