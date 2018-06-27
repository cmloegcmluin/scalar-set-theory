#!/usr/bin/env bash

mkdir node_modules
npm i elm

elm-package install -y

elm-reactor -p 8001 &
cd integration-tests
npm i
npm test
