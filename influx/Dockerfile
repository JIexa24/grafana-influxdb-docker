FROM debian:buster
LABEL Author="Alexey Romanuta R9ODT"

ARG IMAGE_VERSION
ENV INFLUX_VERSION=${IMAGE_VERSION} \
    GOSU_VERSION=1.12

RUN groupadd -g 1000 influxdb && \
    useradd -m -d /var/lib/influxdb -s /usr/sbin/nologin -g 1000 -u 1000 influxdb
RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y \
    wget \ 
    ca-certificates \
    procps
RUN apt-get update && \
	dpkgArch="$(dpkg --print-architecture | awk -F- '{ print $NF }')"; \
	wget --no-verbose -O /usr/local/bin/gosu "https://github.com/tianon/gosu/releases/download/$GOSU_VERSION/gosu-$dpkgArch"; \
	chmod +x /usr/local/bin/gosu; \
	gosu --version; \
	gosu nobody true
RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y \
    influxdb=${IMAGE_VERSION} \
    influxdb-client=${IMAGE_VERSION}

EXPOSE 8086
WORKDIR /var/lib/influxdb

COPY ./docker-entrypoint.sh /bin/docker-entrypoint.sh
ENTRYPOINT ["/bin/docker-entrypoint.sh"]

COPY ./start.sh /bin/start.sh
CMD ["/bin/start.sh"]

