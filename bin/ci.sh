#!/usr/bin/env bash

elm-test

elm-reactor -p 8001 &
cd integration-tests
npm i
npm run ci
