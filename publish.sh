#!/usr/bin/env bash

DOCKER_ID_USER="cometvisu"
docker tag cv-dev-helper $DOCKER_ID_USER/dev-helper:latest
docker push $DOCKER_ID_USER/dev-helper:latest