FROM debian:buster
LABEL Author="Alexey Romanuta R9ODT"

ARG GRAFANA_VERSION=6.7.1
ARG GRAFANA_URL="https://dl.grafana.com/oss/release/"
ARG GRAFANA_PACK="grafana_${GRAFANA_VERSION}_amd64.deb"

RUN groupadd -g 1000 grafana && \
    useradd -m -d /usr/share/grafana -s /usr/sbin/nologin -g 1000 -u 1000 grafana
RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y \
    tar \
    libfontconfig \
    curl \
    ca-certificates \
    wget \
    sudo \
    procps
RUN wget --no-verbose $GRAFANA_URL$GRAFANA_PACK && \
    dpkg -i $GRAFANA_PACK && rm -f $GRAFANA_PACK

EXPOSE 3000
WORKDIR /usr/share/grafana
USER grafana
COPY ./start.sh /bin/start.sh

ENTRYPOINT ["/bin/bash"]
CMD ["/bin/start.sh"]