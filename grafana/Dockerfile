FROM debian:buster
LABEL Author="Alexey Romanuta R9ODT"

ARG IMAGE_VERSION
ARG GRAFANA_URL="https://dl.grafana.com/oss/release/"
ARG GRAFANA_PACK="grafana_${IMAGE_VERSION}_amd64.deb"

ENV GF_CONFIG="/usr/share/grafana/conf/defaults.ini" \
    GF_DATA="/usr/share/grafana/data" \
    GF_HOME="/usr/share/grafana" \
    GF_LOGS="/usr/share/grafana/data/log" \
    GF_PLUGIN_DIR="/usr/share/grafana/data/plugins" \
    GF_PROVISIONING="/usr/share/grafana/conf/provisioning" \
    GRAFANA_VERSION=${IMAGE_VERSION} \
    IMAGE_USER=grafana \
    GOSU_VERSION=1.12

RUN groupadd -g 1000 ${IMAGE_USER} && \
    useradd -m -d ${GF_HOME} -s /usr/sbin/nologin -g 1000 -u 1000 ${IMAGE_USER}
RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y \
    libfontconfig \
    ca-certificates \
    wget \
    procps ; \
    rm -rf /var/lib/apt/lists/* /var/cache/apt
RUN dpkgArch="$(dpkg --print-architecture | awk -F- '{ print $NF }')"; \
	wget --no-verbose -O /usr/local/bin/gosu "https://github.com/tianon/gosu/releases/download/$GOSU_VERSION/gosu-$dpkgArch"; \
	chmod +x /usr/local/bin/gosu; \
	gosu --version; \
	gosu nobody true
RUN wget --no-verbose ${GRAFANA_URL}${GRAFANA_PACK} && \
    dpkg -i ${GRAFANA_PACK} && rm -f ${GRAFANA_PACK}

EXPOSE 3000
WORKDIR ${GF_HOME}

COPY ./docker-entrypoint.sh /bin/docker-entrypoint.sh
ENTRYPOINT ["/bin/docker-entrypoint.sh"]

COPY ./start.sh /bin/start.sh
CMD ["/bin/start.sh"]