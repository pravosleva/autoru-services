#!/bin/bash
yarn --cwd ./backend build &&
REACT_APP_API_ENDPOINT="" yarn --cwd ./frontend build
