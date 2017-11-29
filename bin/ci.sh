mkdir node_modules

npm i elm elm-test

elm-test init

./node_modules/.bin/elm-package install -y

cd tests
../node_modules/.bin/elm-package install -y

export PATH=${PATH}:/home/travis/build/cmloegcmluin/scalar-set-theory/node_modules/.bin

cd /home/travis/build/cmloegcmluin/scalar-set-theory/
elm-test

elm-reactor -p 8001 &
cd integration-tests
npm i
npm test
