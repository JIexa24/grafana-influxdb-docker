FROM debian:buster
LABEL Author="Alexey Romanuta R9ODT"

ARG IMAGE_VERSION
ARG GRAFANA_URL="https://dl.grafana.com/oss/release/"
ARG GRAFANA_PACK="grafana_${IMAGE_VERSION}_amd64.deb"

ENV GRAFANA_CONFIG="/usr/share/grafana/conf/defaults.ini" \
    GRAFANA_DATA="/usr/share/grafana/data" \
    GRAFANA_HOME="/usr/share/grafana" \
    GRAFANA_LOGS="/usr/share/grafana/data/log" \
    GRAFANA_PLUGINS="/usr/share/grafana/data/plugins" \
    GRAFANA_PROVISIONING="/usr/share/grafana/conf/provisioning" \
    GRAFANA_VERSION=${IMAGE_VERSION} \
    GOSU_VERSION=1.12

RUN groupadd -g 1000 grafana && \
    useradd -m -d ${GRAFANA_HOME} -s /usr/sbin/nologin -g 1000 -u 1000 grafana
RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y \
    libfontconfig \
    ca-certificates \
    wget \
    procps
RUN apt-get update && \
	dpkgArch="$(dpkg --print-architecture | awk -F- '{ print $NF }')"; \
	wget --no-verbose -O /usr/local/bin/gosu "https://github.com/tianon/gosu/releases/download/$GOSU_VERSION/gosu-$dpkgArch"; \
	chmod +x /usr/local/bin/gosu; \
	gosu --version; \
	gosu nobody true
RUN wget --no-verbose ${GRAFANA_URL}${GRAFANA_PACK} && \
    dpkg -i ${GRAFANA_PACK} && rm -f ${GRAFANA_PACK}

EXPOSE 3000
WORKDIR ${GRAFANA_HOME}

COPY ./docker-entrypoint.sh /bin/docker-entrypoint.sh
ENTRYPOINT ["/bin/docker-entrypoint.sh"]

COPY ./start.sh /bin/start.sh
CMD ["/bin/start.sh"]