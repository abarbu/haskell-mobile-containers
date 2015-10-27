#!/bin/bash

set -euf -o pipefail

echo "tns create"
docker run -it --privileged --net=host -v $PWD:/src abarbu/nativescript tns create hello

cd hello
echo "tns platform add"
docker run -it --privileged --net=host -v $PWD:/src abarbu/nativescript tns platform add android

echo "ghcjs exists"
docker run -it -v $PWD:/src abarbu/stack-ghcjs-nativescript:lts-3.0 ghcjs --help

echo "Done"
