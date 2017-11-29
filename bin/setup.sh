npm i -g elm elm-test elm-analyse
elm-test init
elm-package install -y

cd integration-tests
npm i

cd ../tests
elm-package install -y

npm config set msvs_version 2017
