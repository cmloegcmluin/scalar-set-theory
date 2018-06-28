#!/usr/bin/env bash

sudo apt-get install g++ build-essential

elm-package install -y

elm-reactor -p 8001 &
cd integration-tests
npm i
npm test
