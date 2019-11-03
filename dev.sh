#!/bin/bash
fuser -k -n tcp 3110 &
fuser -k -n tcp 3000 &
yarn --cwd ./backend develop &
yarn --cwd ./frontend start
