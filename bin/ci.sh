#!/usr/bin/env bash

elm-reactor -p 8001 &

cd integration-tests

npm i

npm test
