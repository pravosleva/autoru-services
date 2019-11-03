# auto.ru autoservices

## Install

### `bash fullstack-init.sh`

Your local repo will be killed.

### `yarn global add pm2@latest`

Once.

## Development

### `bash dev.sh`

- Backend [localhost:3110](http://localhost:3110)
- Frontend [localhost:3000](http://localhost:3000)

## Production

### `bash build.sh`

### `pm2 start ecosystem.config.js`

_ecosystem.config.js_
```js
module.exports = {
  apps : [{
    name: 'strapi-autoru-3110',
    cwd: '/home/den/projects/autoru-services/backend',
    script: 'yarn start',
    env: {
      PORT: '3110',
      NODE_ENV: 'production',
      DATABASE_HOST: 'ds241968.mlab.com', // database Endpoint under 'Connectivity & Security' tab
      DATABASE_PORT: '',
      DATABASE_NAME: 'autoru-services',  // DB name under 'Configuration' tab
      DATABASE_USERNAME: '', // default username
      DATABASE_PASSWORD: '',
      DATABASE_AUTHENTICATION_DATABASE: 'autoru-services'
    },
  }],
};
```
