start:
	elm reactor

build:
	elm make src/ScalarSetTheory/Main.elm --output dist/index.html

deploy:
	./bin/deploy.sh

test:
	make unit && make integration

unit:
	elm-test

integration:
	./bin/integration.sh

lint:
	elm-format src/ && elm-format tests/

setup:
	./bin/setup.sh
