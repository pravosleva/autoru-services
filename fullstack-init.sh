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
echo "  DEVELOPMENT MODE: pm2 start ecosystem.config.js" &&
echo "" &&
echo "👉 BUT YOU HAVE TO CHECK THIS:" &&
echo "  🔥 STEP 1: ./backend/config/environments/development/database.json" &&
echo "  + STEP 2: ./frontend/.env.development" &&
echo "REACT_APP_API_ENDPOINT=\"http://localhost:3110\"
" > frontend/.env.development &&
echo "  🚀 STEP 3: RUN $ bash dev.sh" &&
echo "===" &&
echo "" &&
echo "  PRODUCTION MODE: pm2 start ecosystem.config.js --env production" &&
echo "" &&
echo "👉 BUT YOU HAVE TO CHECK THIS:" &&
echo "  + STEP 1: ./frontend/.env.production" &&
echo "REACT_APP_API_ENDPOINT=\"http://selection4test.ru:3110\"
" > frontend/.env.production &&
echo "  🔥 STEP 2: ./ecosystem.config.js" &&
echo "module.exports = {
  apps : [{
    name: 'strapi-autoru-3110',
    cwd: '/home/den/projects/autoru-services/backend', // ATTENTION!
    script: 'yarn.js', // Wtf? https://github.com/yarnpkg/yarn/issues/3405#issuecomment-301332585
    args: 'start',
    env: {
      NODE_ENV: 'development',
      PORT: '3110',
      DATABASE_HOST: 'ds241968.mlab.com', // database Endpoint under 'Connectivity & Security' tab
      DATABASE_PORT: '41968',
      DATABASE_NAME: 'autoru-services', // DB name under 'Configuration' tab
      DATABASE_USERNAME: '<DATABASE_USERNAME>', // default username
      DATABASE_PASSWORD: '<DATABASE_PASSWORD>',
      DATABASE_AUTHENTICATION_DATABASE: 'autoru-services'
    },
    env_production: {
      NODE_ENV: 'production',
      PORT: '3110',
      DATABASE_HOST: 'ds241968.mlab.com',
      DATABASE_PORT: '41968',
      DATABASE_NAME: 'autoru-services',
      DATABASE_USERNAME: '<DATABASE_USERNAME>',
      DATABASE_PASSWORD: '<DATABASE_PASSWORD>',
      DATABASE_AUTHENTICATION_DATABASE: 'autoru-services'
    }
  }],
};
" > ecosystem.config.js &&
echo "  🚀 STEP 3: $ bash build.sh" &&
echo "  🚀 STEP 4: $ pm2 start" # && rm -rf fullstack-init.sh
