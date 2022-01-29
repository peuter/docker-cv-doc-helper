#!/usr/bin/env bash

docker build --no-cache -t cv-dev-helper .
ID=`docker ps -a | grep cv_doc | awk '{print $1}'`
if [ ! -z "$ID" ]; then
    docker rm $ID
fi