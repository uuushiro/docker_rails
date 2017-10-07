#!/usr/bin/env bash

docker-compose build

docker-compose run --rm web rails new . --force --database=mysql --skip-bundle

cp -f template/database.yml config/database.yml

docker-compose run --rm web bundle exec spring binstub --all
