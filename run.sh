#!/usr/bin/env bash

cid=$(docker ps -a -f name=cv_doc --quiet)
if [[ ! -z "$cid" ]]; then
    docker rm $cid
fi
#docker run -it -v "$(pwd)"/:/home/cometvisu --name cv_doc -e OPTIONS="$@" peuter/cv-doc-helper
docker run -it -v "$(pwd)"/:/home/cometvisu --name cv_doc -e OPTIONS="$@" cv-doc-helper