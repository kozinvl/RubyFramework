#!/usr/bin/env bash

docker build -t bdd_cucumber .
docker run -d bdd_cucumber
# docker exec -it <id> bash
