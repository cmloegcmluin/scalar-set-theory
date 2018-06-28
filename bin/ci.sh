#!/usr/bin/env bash

elm-package install -y

elm-reactor -p 8001 &

cd integration-tests

npm i

npm test
