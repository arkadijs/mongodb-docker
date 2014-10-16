#!/bin/sh -xe
docker build -t arkadi/mongodb:2 .
docker tag arkadi/mongodb:2 arkadi/mongodb:latest
docker push arkadi/mongodb
