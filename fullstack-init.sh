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
echo "  🔥 STEP 1: ./ecosystem.dev.config.js" &&
echo "module.exports = {
  apps : [{
    name: 'strapi-autoru-3110',
    cwd: `${__dirname}/backend`,
    script: 'yarn',
    args: 'develop',
    interpreter: 'none',
    env: {
      NODE_ENV: 'development',
      PORT: '3110',
      DATABASE_HOST: 'ds017584.mlab.com',
      DATABASE_PORT: '17584',
      DATABASE_NAME: 'autoservices-tst-db',
      DATABASE_USERNAME: '<DATABASE_USERNAME>',
      DATABASE_PASSWORD: '<DATABASE_PASSWORD>',
      DATABASE_AUTHENTICATION_DATABASE: 'autoservices-tst-db'
    }
  }, {
    name: 'strapi-autoru-frontend-3000',
    cwd: `${__dirname}/frontend`,
    script: 'yarn',
    args: 'start',
    interpreter: 'none',
    env: {
      NODE_ENV: 'development',
      PORT: '3000',
      REACT_APP_API_ENDPOINT: 'http://localhost:3110'
    }
  }],
};
" > ecosystem.dev.config.js &&
echo "  🔥 STEP 2 (if you dont use pm2): ./frontend/.env.development" &&
echo "REACT_APP_API_ENDPOINT=\"http://localhost:3110\"
" > frontend/.env.development &&
echo "" &&
echo "🚀 $ pm2 start ecosystem.dev.config.js" &&
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
    cwd: `${__dirname}/backend`,
    script: 'yarn',
    args: 'start',
    interpreter: 'none',
    env: {
      NODE_ENV: 'production',
      PORT: '3110',
      DATABASE_HOST: 'ds017584.mlab.com',
      DATABASE_PORT: '17584',
      DATABASE_NAME: 'autoservices-tst-db',
      DATABASE_USERNAME: '<DATABASE_USERNAME>',
      DATABASE_PASSWORD: '<DATABASE_PASSWORD>',
      DATABASE_AUTHENTICATION_DATABASE: 'autoservices-tst-db'
    }
  }],
};
" > ecosystem.prod.config.js &&
echo "" &&
echo "🚀 $ bash build-all.sh" &&
echo "🚀 $ pm2 start ecosystem.prod.config.js" &&
echo "" &&
echo "===" # && rm -rf fullstack-init.sh
