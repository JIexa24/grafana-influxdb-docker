FROM debian:buster
LABEL Author="Alexey Romanuta R9ODT"

ARG TELEGRAF_URL_PREFIX="https://dl.influxdata.com/telegraf/releases/"
ARG IMAGE_VERSION
ARG ARCH="amd64"

RUN groupadd -g 1000 telegraf && \
    useradd -m -d /etc/telegraf -s /usr/sbin/nologin -g 1000 -u 1000 telegraf
RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y \
    procps \
    snmp \
    wget \
    curl 
RUN wget --no-verbose \
    ${TELEGRAF_URL_PREFIX}telegraf_${IMAGE_VERSION}-1_${ARCH}.deb && \
    dpkg -i telegraf_${IMAGE_VERSION}-1_${ARCH}.deb && \
    rm -f telegraf_${IMAGE_VERSION}-1_${ARCH}.deb*

WORKDIR /etc/telegraf
USER telegraf
COPY ./start.sh /bin/start.sh

ENTRYPOINT ["/bin/bash"]
CMD ["/bin/start.sh"]
