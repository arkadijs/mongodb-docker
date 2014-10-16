#!/bin/sh -xe
tmp=$(mktemp -d)
docker run -ti --rm \
    -p 30000:27017 \
    -v $tmp:/data/db \
    -e MONGOD_OPTIONS='--nojournal --smallfiles --noprealloc --auth --syslog' \
    -e MONGO_ROOT_PASSWORD=qwerty \
    arkadi/mongodb \
    /sbin/my_init -- bash -l
