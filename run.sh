#!/usr/bin/env bash

cid=$(docker ps -a -f name=cv_doc --quiet)
if [[ ! -z "$cid" ]]; then
    docker rm $cid
fi

if [[ -z "$COMETVISU_PATH" ]]; then
    echo "Please set the environment variable to your local CometVisu clone e.g. export COMETVISU_PATH=/path/to/yout/clone"
    exit 0
fi
export COMMAND=$@
docker run --privileged --net=host -it -v "$COMETVISU_PATH":"$COMETVISU_PATH" -v /dev/shm:/dev/shm --name cv_doc --workdir "$COMETVISU_PATH" -e COMMAND cv-doc-helper