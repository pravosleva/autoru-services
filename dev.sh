#!/bin/bash

# DEPRECATED: Use pm2 instead of this

fuser -k -n tcp 3110 &
fuser -k -n tcp 3000 &
DATABASE_HOST= DATABASE_PORT= DATABASE_NAME= DATABASE_USERNAME= DATABASE_PASSWORD= DATABASE_AUTHENTICATION_DATABASE= yarn --cwd ./backend develop &&
NODE_ENV="development" yarn --cwd ./frontend start
