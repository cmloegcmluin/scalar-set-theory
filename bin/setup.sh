#!/usr/bin/env bash

npm i -g elm elm-test elm-analyse

elm-test init
rm tests/Example.elm

elm-package install -y

cd tests
elm-package install -y

cd ../integration-tests
npm i

npm config set msvs_version 2017
