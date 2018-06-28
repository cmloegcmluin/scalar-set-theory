#!/usr/bin/env bash

set -e -x

elm-test init
elm-test

elm-reactor -p 8001 &
cd integration-tests
npm i
npm run ci
