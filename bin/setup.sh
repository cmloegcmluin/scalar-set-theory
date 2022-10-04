#!/usr/bin/env bash

if [[ $(gcloud config configurations list | grep -m1 scalar-set-theory) ]] ; then
	echo "The 'scalar-set-theory' configuration already exists."
else
	gcloud config configurations create scalar-set-theory
fi
gcloud config configurations activate scalar-set-theory
gcloud config set project scalar-set-theory
gcloud config set account kingwoodchuckii@gmail.com
gcloud auth login kingwoodchuckii@gmail.com

npm i -g elm-test elm-format

elm-test init
rm tests/Example.elm

make build

cd integration-tests
npm i
