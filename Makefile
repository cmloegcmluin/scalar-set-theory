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
	elm-reactor -p 8001 & lsof -ti:4444 | xargs kill && cd integration-tests && npm test

setup:
	elm-package install -y && npm install -g elm-test && cd tests && elm-package install -y && cd ../integration-tests && npm i
