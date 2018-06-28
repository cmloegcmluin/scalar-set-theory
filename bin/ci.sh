#!/usr/bin/env bash

elm-package install -y

elm-reactor -p 8001 &

cd integration-tests

apt-get install -y g++ build-essential

npm i

npm test
