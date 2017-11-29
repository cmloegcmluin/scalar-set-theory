#!/usr/bin/env bash

elm-reactor -p 8001 &

lsof -ti:4444 | xargs kill
lsof -ti:8001 | xargs kill

cd integration-tests
npm test
