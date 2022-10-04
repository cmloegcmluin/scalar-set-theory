#!/usr/bin/env bash

elm reactor --port 8001 &

cd integration-tests
npm test
