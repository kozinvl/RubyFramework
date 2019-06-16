#!/usr/bin/env bash

#docker build -t bdd_cucumber .
#docker run -d bdd_cucumber

# up -d working in background
docker-compose build && docker-compose up
#docker-compose down

# docker exec -it <id> bash
