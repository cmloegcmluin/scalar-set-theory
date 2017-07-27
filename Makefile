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
	npm install -g elm && elm-package install -y && cd integration-tests && npm i && cd ../tests && elm-package install -y

setup:
	elm-package install -y && cd integration-tests && npm i && cd ../tests && elm-package install -y && cd elm-stuff/packages/rtfeldman/node-test-runner/3.0.0/ && npm i && export PATH=$PATH:~\workspace\scalar-set-theory\tests\elm-stuff\packages\rtfeldman\node-test-runner\3.0.0\bin && npm config set msvs_version 2017 && npm i -g elm-analyse
