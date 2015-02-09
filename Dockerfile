FROM phusion/baseimage:0.9.16
MAINTAINER Arkadi Shishlov <arkadi.shishlov@gmail.com>
RUN apt-get update \
    && apt-get upgrade -y \
    && apt-get clean \
    && find /var/lib/apt/lists -type f -delete
RUN curl -sS https://fastdl.mongodb.org/linux/mongodb-linux-x86_64-2.6.7.tgz \
        | tar xz --no-same-owner -C /usr/local --strip-components 1 --wildcards -f - \*/bin/\* \
    && mkdir /etc/service/mongod \
    && groupadd -r mongodb \
    && useradd -r -g mongodb mongodb
ADD mongod.sh /etc/service/mongod/run
ADD mongo-admin.sh /etc/my_init.d/90_mongo-admin.sh
RUN rm -f /etc/service/sshd/down
VOLUME /data/db
EXPOSE 22 27017
