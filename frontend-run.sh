#!/bin/sh

export DEPLOYMENT_ENV="$1"

docker build --build-arg="RUN_FILE=lib/main.dart" --no-cache -t flutter-web:$DEPLOYMENT_ENV .
docker compose up -d flutter-web-prod