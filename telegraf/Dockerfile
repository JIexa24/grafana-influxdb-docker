FROM debian:buster
LABEL Author="Alexey Romanuta R9ODT"

ARG TELEGRAF_VERSION=1.14.1
ARG ARCH=amd64

RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y \
    procps \
    snmp \
    wget \
    curl 

RUN wget --no-verbose \
    https://dl.influxdata.com/telegraf/releases/telegraf_${TELEGRAF_VERSION}-1_${ARCH}.deb && \
    dpkg -i telegraf_${TELEGRAF_VERSION}-1_${ARCH}.deb && \
    rm -f telegraf_${TELEGRAF_VERSION}-1_${ARCH}.deb*

COPY ./start.sh /bin/start.sh

#ENTRYPOINT /bin/bash
CMD ["/bin/bash", "/bin/start.sh"]
