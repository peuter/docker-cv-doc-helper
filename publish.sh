#!/usr/bin/env bash

DOCKER_ID_USER="peuter"
docker tag cv-doc-helper $DOCKER_ID_USER/cv-doc-helper
docker push $DOCKER_ID_USER/cv-doc-helper