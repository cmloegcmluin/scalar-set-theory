start:
	elm-reactor

build:
	elm-make src/ScalarSetTheory/Main.elm --output dist/index.html

deploy:
	cf push scalar-set-theory -b https://github.com/cloudfoundry/staticfile-buildpack.git -m 64m

test:
	make unit && make integration

unit:
	elm-test

integration:
	elm-reactor -p 8001 & cd integration-tests && npm test

setup:
	elm-package install && cd integration-tests && npm i
