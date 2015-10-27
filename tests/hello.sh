#!/bin/bash

set -euf -o pipefail

docker run -it --rm --privileged --net=host -v $PWD:/src abarbu/nativescript tns create hello
cd hello
docker run -it --rm --privileged --net=host -v $PWD:/src abarbu/nativescript tns platform add android
