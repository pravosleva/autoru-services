# auto.ru autoservices

## Install

### `bash fullstack-init.sh`

> _Your local repo will be killed._  
> **Check envs!**  
> - `ecosystem.dev.config.js`  
> - `ecosystem.prod.config.js`

### `yarn global add pm2@latest`

_I have installed pm2@4.1.2_

## Development

### `pm2 start ecosystem.dev.config.js`

_Backend [localhost:3110](http://localhost:3110) / Frontend [localhost:3000](http://localhost:3000)_

_`ecosystem.dev.config.js` for example:_
```js
module.exports = {
  apps : [{
    name: '<PM2_PROCESS_NAME>',
    cwd: __diraname + '/backend',
    script: 'yarn',
    args: 'develop',
    interpreter: 'none',
    env: {
      PORT: '<PORT>', // Same as ./frontend/.env.development
      NODE_ENV: 'development',
      DATABASE_HOST: '<DATABASE_HOST>',
      DATABASE_PORT: '<DATABASE_PORT>',
      DATABASE_NAME: '<DATABASE_NAME>',
      DATABASE_USERNAME: '<DATABASE_USERNAME>',
      DATABASE_PASSWORD: '<DATABASE_PASSWORD>',
      DATABASE_AUTHENTICATION_DATABASE: '<DATABASE_AUTHENTICATION_DATABASE>'
    }
  }, {
    name: '<PM2_PROCESS_NAME>',
    cwd: __diraname + '/frontend',
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
```

## Production

### `bash build-all-prod.sh`

_Backend will be rebuilt; Frontend will be build and moved to `./backend/public`._

### `pm2 start ecosystem.prod.config.js`

_[localhost:3110](http://localhost:3110)_

_`ecosystem.prod.config.js` for example:_
```js
module.exports = {
  apps : [{
    name: '<PM2_PROCESS_NAME>',
    cwd: __diraname + '/backend',
    script: 'yarn',
    args: 'start',
    interpreter: 'none',
    env: {
      PORT: '<PORT>', // Same as ./frontend/.env.production
      NODE_ENV: 'production',
      DATABASE_HOST: '<DATABASE_HOST>',
      DATABASE_PORT: '<DATABASE_PORT>',
      DATABASE_NAME: '<DATABASE_NAME>',
      DATABASE_USERNAME: '<DATABASE_USERNAME>',
      DATABASE_PASSWORD: '<DATABASE_PASSWORD>',
      DATABASE_AUTHENTICATION_DATABASE: '<DATABASE_AUTHENTICATION_DATABASE>'
    }
  }],
};
```

### `bash build-front-prod.sh`

_Frontend will be build and moved to `./backend/public`. Could be used when production is running._
