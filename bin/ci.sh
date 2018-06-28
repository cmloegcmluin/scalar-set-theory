#!/usr/bin/env bash

elm-package install -y

elm-reactor -p 8001 &

cd integration-tests

sudo apt-get install g++ build-essential
npm i -g node-gyp
npm i

npm test
