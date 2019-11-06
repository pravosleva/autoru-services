# auto.ru autoservices

## Install

### `bash fullstack-init.sh`

_Your local repo will be killed._

### `yarn global add pm2@latest`

_I have installed pm2@3.2.8_

## Development

### `bash dev.sh`

> **Check envs!** Backend [localhost:3110](http://localhost:3110) / Frontend [localhost:3000](http://localhost:3000)

## Production

### `bash build-all.sh`

> **Check envs!**

_Backend will be rebuilt; Frontend will be build and moved to `./backend/public`._

### `pm2 start ecosystem.config.js [--env production]`

> **Check envs!** [localhost:3110](http://localhost:3110)

_ecosystem.config.js_
```js
module.exports = {
  apps : [{
    name: '<PROCESS_NAME>',
    cwd: '/home/<PATH_TO>/backend',
    script: 'yarn.js', // Wtf? https://github.com/yarnpkg/yarn/issues/3405#issuecomment-301332585
    args: 'start',
    env: {
      PORT: '<PORT>', // Same as ./frontend/.env.development
      NODE_ENV: 'development',
      DATABASE_HOST: '<DATABASE_HOST>', // database Endpoint under 'Connectivity & Security' tab
      DATABASE_PORT: '<DATABASE_PORT>',
      DATABASE_NAME: '<DATABASE_NAME>', // DB name under 'Configuration' tab
      DATABASE_USERNAME: '<DATABASE_USERNAME>',
      DATABASE_PASSWORD: '<DATABASE_PASSWORD>',
      DATABASE_AUTHENTICATION_DATABASE: '<DATABASE_AUTHENTICATION_DATABASE>'
    },
    env_production: {
      PORT: '<PORT>', // Same as ./frontend/.env.production
      NODE_ENV: 'production',
      DATABASE_HOST: '<DATABASE_HOST>',
      DATABASE_PORT: '<DATABASE_PORT>',
      DATABASE_NAME: '<DATABASE_NAME>',
      DATABASE_USERNAME: '<DATABASE_USERNAME>',
      DATABASE_PASSWORD: '<DATABASE_PASSWORD>',
      DATABASE_AUTHENTICATION_DATABASE: '<DATABASE_AUTHENTICATION_DATABASE>'
    },
  }],
};
```

### `bash build-front-only.sh`

> **Check envs!**

_Frontend will be build and moved to `./backend/public`. Could be used when production is running._
