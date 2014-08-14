#!/bin/sh
if test -z "$MONGO_ROOT_PASSWORD"; then exit 0; fi
(
sleep 5
auth="-u root -p $MONGO_ROOT_PASSWORD"
js="if (!db.getUser('root')) { db.createUser({ user: 'root', pwd: '$MONGO_ROOT_PASSWORD', roles: [ 'userAdminAnyDatabase' ] }) }"
until mongo admin --eval "$js" || mongo admin $auth --eval "$js"; do sleep 5; done
) &
exit 0
