#!/usr/bin/env bash

echo "installing all sorts of crap"
sudo apt-get update \
  && sudo apt-get install -y \
    python \
    gcc \
    make \
    g++ \
    build-essential \
#  && npm i -g node-gyp
  echo "finished installing crap"

which build-essential
which g++
which gcc

elm-package install -y

elm-reactor -p 8001 &

cd integration-tests

echo "node version???"
node -v
nodejs -v
#npm i fibers
npm i

npm test
