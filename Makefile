start:
	elm-reactor

build:
	elm-make src/ScalarSetTheory/Main.elm --output dist/index.html

deploy:
	cf login -a api.run.pivotal.io -o ${PWS_ORG} -s ${PWS_SPACE} -u ${PWS_USERNAME} -p ${PWS_PASSWORD} && cf push scalar-set-theory -b https://github.com/cloudfoundry/staticfile-buildpack.git -m 64m

test:
	make unit && make integration

unit:
	elm-test

integration:
	elm-reactor -p 8001 & lsof -ti:4444 | xargs kill && cd integration-tests && npm test

analyze:
	elm-analyse

ci:
	mkdir node_modules && npm install elm && ./node_modules/.bin/elm-package install -y && cd tests && ../node_modules/.bin/elm-package install -y && cd elm-stuff/packages/rtfeldman/node-test-runner/3.0.0/ && npm i && export PATH=${PATH}:/home/travis/build/cmloegcmluin/scalar-set-theory/tests/elm-stuff/packages/rtfeldman/node-test-runner/3.0.0/bin:/home/travis/build/cmloegcmluin/scalar-set-theory/node_modules/.bin && chmod u=rx /home/travis/build/cmloegcmluin/scalar-set-theory/tests/elm-stuff/packages/rtfeldman/node-test-runner/3.0.0/bin/elm-test && cd /home/travis/build/cmloegcmluin/scalar-set-theory/ && elm-test && elm-reactor -p 8001 & cd integration-tests && npm i && npm test

setup:
	npm install -g elm && elm-package install -y && cd integration-tests && npm i && cd ../tests && elm-package install -y && cd elm-stuff/packages/rtfeldman/node-test-runner/3.0.0/ && npm i && export PATH=$PATH:~\workspace\scalar-set-theory\tests\elm-stuff\packages\rtfeldman\node-test-runner\3.0.0\bin && npm config set msvs_version 2017 && npm i -g elm-analyse
