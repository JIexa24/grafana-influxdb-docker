FROM debian:buster
LABEL Author="Alexey Romanuta R9ODT"

ARG TELEGRAF_URL_PREFIX="https://dl.influxdata.com/telegraf/releases/"
ARG IMAGE_VERSION
ARG ARCH="amd64"
ENV TELEGRAF_VERSION=${IMAGE_VERSION} \
    GOSU_VERSION=1.12

RUN groupadd -g 1000 telegraf && \
    useradd -m -d /etc/telegraf -s /bin/sh -g 1000 -u 1000 telegraf
RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y \
    ca-certificates \
    wget \
    procps
RUN apt-get update && \
	dpkgArch="$(dpkg --print-architecture | awk -F- '{ print $NF }')"; \
	wget --no-verbose -O /usr/local/bin/gosu "https://github.com/tianon/gosu/releases/download/$GOSU_VERSION/gosu-$dpkgArch"; \
	chmod +x /usr/local/bin/gosu; \
	gosu --version; \
	gosu nobody true
RUN wget --no-verbose \
    ${TELEGRAF_URL_PREFIX}telegraf_${IMAGE_VERSION}-1_${ARCH}.deb && \
    dpkg -i telegraf_${IMAGE_VERSION}-1_${ARCH}.deb && \
    rm -f telegraf_${IMAGE_VERSION}-1_${ARCH}.deb*

WORKDIR /etc/telegraf

COPY ./docker-entrypoint.sh /bin/docker-entrypoint.sh
ENTRYPOINT ["/bin/docker-entrypoint.sh"]

COPY ./start.sh /bin/start.sh
CMD ["/bin/start.sh"]
