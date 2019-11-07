#!/bin/bash
yarn --cwd ./backend build &&
NODE_ENV="production" yarn --cwd ./frontend build
