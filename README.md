#### MongoDB 2.6 Docker image

This image is based on [phusion/baseimage] so it has proper boot sequence and `mongod` process supervision. It also supports MongoDB [authentication].

phusion/baseimage is Ubuntu 14.04 LTS based image with [runit] init, cron, syslog-ng, and [sshd].

Usage:

    docker run -ti --rm \
        -p 30000:27017 \ # or just plain -P
        -v /srv/mongo:/data/db \ 
        -e MONGOD_OPTIONS='--nojournal --smallfiles --noprealloc --auth' \
        -e MONGO_ROOT_PASSWORD=qwerty \
        arkadi/mongodb \
        /sbin/my_init -- bash -l

- You may skip MONGOD_OPTIONS or set your own.
- To use syslog, add [--syslog](http://docs.mongodb.org/manual/reference/program/mongod/#cmdoption--syslog) to MONGOD_OPTIONS.
- MONGO_ROOT_PASSWORD and `--auth` are optional. If set, the admin user will be `root/qwerty` with `admin/userAdminAnyDatabase` privilege assigned.
- `-ti  ... /sbin/my_init -- bash -l` is optional, only if you want to enter the container in-band, not through [ssh](https://github.com/phusion/baseimage-docker/#login-to-the-container-or-running-a-command-inside-it-via-ssh).

Connect:

    mongo localhost:30000/admin -u root -p qwerty

Make sure your host mongo util is 2.6.
The MongoDB binaries used are official build from mongodb.org, but they lack SSL connectivity.

[phusion/baseimage]: http://phusion.github.io/baseimage-docker/
[authentication]: http://docs.mongodb.org/manual/core/security-introduction/
[runit]: http://smarden.org/runit/
[sshd]: https://github.com/phusion/baseimage-docker#login-to-the-container-or-running-a-command-inside-it-via-ssh
