#!/usr/bin/env bash

mkdir node_modules
npm i elm elm-test
export PATH=${PATH}:/home/travis/build/cmloegcmluin/scalar-set-theory/node_modules/.bin

elm-test init

elm-package install -y

cd tests
elm-package install -y

elm-test

cd ../integration-tests
npm i
elm-reactor -p 8001 &
npm test
