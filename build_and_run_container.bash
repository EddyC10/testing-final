#!/usr/bin/env bash

L_TAG=collex

docker build --no-cache --tag ${L_TAG} -f Dockerfile .

docker run --rm -p 3000:3000 -ti ${L_TAG}

exit 0
