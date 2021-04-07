#!/usr/bin/env bash

source ./.env

docker build . -t php-fpm

docker-compose up -d

docker exec -it php-fpm /bin/bash install.sh

xdg-open $BASE_URL