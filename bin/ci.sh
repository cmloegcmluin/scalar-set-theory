#!/usr/bin/env bash

mkdir node_modules
npm i elm

elm-package install -y

elm-make /home/travis/build/cmloegcmluin/scalar-set-theory/src/ScalarSetTheory/Main.elm --output /home/travis/build/cmloegcmluin/scalar-set-theory/dist/index.html
elm-reactor -p 8001 &
cd integration-tests
npm i
npm test
