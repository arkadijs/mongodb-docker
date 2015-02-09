#!/bin/sh -xe
t=arkadi/mongodb
v=2.6.7-2
docker build -t $t:$v .
docker tag -f $t:$v $t:latest
docker push $t:$v
docker push $t:latest
