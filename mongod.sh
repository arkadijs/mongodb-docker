#!/bin/sh
u=mongodb:mongodb
chown $u /data/db
exec chpst -u $u mongod $MONGOD_OPTIONS
