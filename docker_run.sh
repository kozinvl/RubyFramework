#!/usr/bin/env bash

#docker build -t bdd_cucumber .
#docker run -d bdd_cucumber

# -d working in background
docker-compose build && docker-compose up -d
docker-compose down

# docker exec -it <id> bash
