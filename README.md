# auto.ru autoservices

## Install

### `bash fullstack-init.sh`

_Your local repo will be killed._

### `yarn global add pm2@latest`

_I have installed pm2@4.1.2_

## Development

### WAY 1: `bash dev.sh`

> **Check envs!**

### WAY 2: `pm2 start ecosystem.dev.config.js`

> **Check envs!**

_Backend [localhost:3110](http://localhost:3110) / Frontend [localhost:3000](http://localhost:3000)_

## Production

### `bash build-all.sh`

> **Check envs!**

_Backend will be rebuilt; Frontend will be build and moved to `./backend/public`._

### `pm2 start ecosystem.prod.config.js`

> **Check envs!**

_[localhost:3110](http://localhost:3110)_

_`ecosystem.[dev|prod].config.js` for example_
```js
module.exports = {
  apps : [{
    name: '<PROCESS_NAME>',
    cwd: '/home/<PATH_TO>/backend',
    script: 'yarn',
    args: 'start',
    interpreter: 'none',
    env: {
      PORT: '<PORT>', // Same as ./frontend/.env.[development|production]
      NODE_ENV: 'development',
      DATABASE_HOST: '<DATABASE_HOST>', // database Endpoint under 'Connectivity & Security' tab
      DATABASE_PORT: '<DATABASE_PORT>',
      DATABASE_NAME: '<DATABASE_NAME>', // DB name under 'Configuration' tab
      DATABASE_USERNAME: '<DATABASE_USERNAME>',
      DATABASE_PASSWORD: '<DATABASE_PASSWORD>',
      DATABASE_AUTHENTICATION_DATABASE: '<DATABASE_AUTHENTICATION_DATABASE>'
    }
  }],
};
```

### `bash build-front-only.sh`

> **Check envs!**

_Frontend will be build and moved to `./backend/public`. Could be used when production is running._
