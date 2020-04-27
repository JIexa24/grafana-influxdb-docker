FROM debian:buster
LABEL Author="Alexey Romanuta R9ODT"

ARG INFLUX_VERSION=1.6.4-1+b22

RUN groupadd -g 1000 influxdb && \
    useradd -m -d /var/lib/influxdb -s /usr/sbin/nologin -g 1000 -u 1000 influxdb
RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y \
    sudo \
    vim \
    nano \
    procps
RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y \
    influxdb=${INFLUX_VERSION} \
    influxdb-client=${INFLUX_VERSION}

EXPOSE 8086
WORKDIR /var/lib/influxdb
USER influxdb
COPY ./start.sh /bin/start.sh

ENTRYPOINT ["/bin/bash"]
CMD ["/bin/start.sh"]

