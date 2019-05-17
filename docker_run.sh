#!/usr/bin/env bash

#docker build -t bdd_cucumber .
#docker run -d bdd_cucumber

docker-compose build && docker-compose up
docker-compose down

# docker exec -it <id> bash
