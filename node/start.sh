#!/bin/bash

sleep 40

cd /app/api
npm install -g npm@latest
npm install

cd /app/api
chmod +x /app/api/node_modules/.bin/nodemon

cd /app/api
npm start

