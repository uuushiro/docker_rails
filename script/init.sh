#!/usr/bin/env bash

docker-compose build
docker-compose run --rm web rails new . --force --database=mysql --skip-bundle
cp -f template/database.yml config/database.yml
docker-compose run --rm web bundle exec spring binstub --all
docker-compose run --rm spring rails db:create
docker-compose run --rm spring rails db:migrate
docker-compose up -d
