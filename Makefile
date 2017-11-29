start:
	elm-reactor

build:
	elm-make src/ScalarSetTheory/Main.elm --output dist/index.html

deploy:
	./bin/deploy.sh

test:
	make unit && make integration

unit:
	elm-test

integration:
	elm-reactor -p 8001 & lsof -ti:4444 | xargs kill && cd integration-tests && npm test

analyze:
	elm-analyse

ci:
	./bin/ci.sh

setup:
	./bin/setup.sh
