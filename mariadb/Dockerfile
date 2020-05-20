FROM ubuntu:bionic
LABEL Author="Alexey Romanuta R9ODT"

ARG IMAGE_VERSION
# ENTRYPOINT ["/bin/bash"]

RUN groupadd -g 1000 mysql && \
    useradd -m -d /var/lib/mysql -s /usr/sbin/nologin -g 1000 -u 1000 mysql
RUN mkdir -p /var/run/mysqld && chown -R mysql:mysql /var/run/mysqld
RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y \
    sudo \
    vim \
    nano \
    procps
RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y \
    mariadb-server=${IMAGE_VERSION}

EXPOSE 3036
WORKDIR /var/lib/mysql
USER mysql

COPY ./docker-entrypoint.sh /bin/docker-entrypoint.sh
ENTRYPOINT ["/bin/docker-entrypoint.sh"]

COPY ./start.sh /bin/start.sh
CMD ["/bin/start.sh"]

