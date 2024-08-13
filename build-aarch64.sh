#!/bin/bash

docker build . -t aendra/overwitch-aarch64:latest
docker create --name overwitch-build aendra/overwitch-aarch64:latest
docker cp overwitch-build:/build/aarch64 $(pwd)
docker rm overwitch-build