#!/usr/bin/env bash

echo "installing all sorts of crap"
apt-get update \
  && apt-get install -y \
    python \
    gcc \
    make \
    g++ \
    build-essential \
  && npm i -g node-gyp
  echo "finished installing crap"

elm-package install -y

elm-reactor -p 8001 &

cd integration-tests

npm i

npm test
