FROM debian:latest
MAINTAINER Alexey Romanuta R9ODT

ENV TELEGRAF_VERSION 1.5.3
ENV ARCH=amd64

RUN apt-get update
RUN DEBIAN_FRONTEND=noninteractive apt-get install snmp wget curl -y

RUN wget --no-verbose https://dl.influxdata.com/telegraf/releases/telegraf_${TELEGRAF_VERSION}-1_${ARCH}.deb && \
    dpkg -i telegraf_${TELEGRAF_VERSION}-1_${ARCH}.deb && \
    rm -f telegraf_${TELEGRAF_VERSION}-1_${ARCH}.deb*

COPY ./start.sh /bin/start.sh

ENTRYPOINT /bin/start.sh
