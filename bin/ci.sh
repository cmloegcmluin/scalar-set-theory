#!/usr/bin/env bash

mkdir node_modules
npm i elm
export PATH=${PATH}:/home/travis/build/cmloegcmluin/scalar-set-theory/node_modules/.bin

elm-package install -y

elm-make src/ScalarSetTheory/Main.elm --output dist/index.html
elm-reactor -p 8001 &
cd integration-tests
npm i
npm test
