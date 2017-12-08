#!/usr/bin/env bash

mkdir node_modules
npm i elm
#npm i elm-test
export PATH=${PATH}:/home/travis/build/cmloegcmluin/scalar-set-theory/node_modules/.bin

#elm-test init
#rm /home/travis/build/cmloegcmluin/scalar-set-theory/tests/Example.elm

#elm-package install -y

#elm-test

elm-reactor -p 8001 &
cd integration-tests
npm i
npm test
