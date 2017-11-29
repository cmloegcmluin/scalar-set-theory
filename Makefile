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
	mkdir node_modules && npm i elm elm-test && elm-test init && ./node_modules/.bin/elm-package install -y && cd tests && ../node_modules/.bin/elm-package install -y && export PATH=${PATH}:/home/travis/build/cmloegcmluin/scalar-set-theory/node_modules/.bin && cd /home/travis/build/cmloegcmluin/scalar-set-theory/ && elm-test && elm-reactor -p 8001 & cd integration-tests && npm i && npm test

setup:
	npm i -g elm elm-test elm-analyse && elm-test init && elm-package install -y && cd integration-tests && npm i && cd ../tests && elm-package install -y && npm config set msvs_version 2017
