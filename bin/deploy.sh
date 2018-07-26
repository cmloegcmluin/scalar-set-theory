#!/usr/bin/env bash

cf login -a api.run.pivotal.io -o ${PWS_ORG} -s ${PWS_SPACE} -u ${PWS_USERNAME} -p ${PWS_PASSWORD}
cf push scalar-set-theory