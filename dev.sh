#!/bin/bash
fuser -k -n tcp 3110 &
fuser -k -n tcp 3000 &
DATABASE_HOST= DATABASE_PORT= DATABASE_NAME= DATABASE_USERNAME= DATABASE_PASSWORD= DATABASE_AUTHENTICATION_DATABASE= yarn --cwd ./backend develop &
REACT_APP_API_ENDPOINT="http://localhost:3110" yarn --cwd ./frontend start
