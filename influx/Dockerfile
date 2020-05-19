FROM debian:buster
LABEL Author="Alexey Romanuta R9ODT"

ARG IMAGE_VERSION
# ENTRYPOINT ["/bin/bash"]

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
    influxdb=${IMAGE_VERSION} \
    influxdb-client=${IMAGE_VERSION}

EXPOSE 8086
WORKDIR /var/lib/influxdb
USER influxdb
COPY ./start.sh /bin/start.sh

CMD ["/bin/bash", "/bin/start.sh"]

