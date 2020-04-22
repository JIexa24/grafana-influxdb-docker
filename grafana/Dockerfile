FROM debian:buster
LABEL Author="Alexey Romanuta R9ODT"

ARG GRAFANA_VERSION=6.7.1
ARG GRAFANA_URL="https://dl.grafana.com/oss/release/"
ARG GRAFANA_PACK="grafana_${GRAFANA_VERSION}_amd64.deb"

RUN apt-get update && apt-get install -qq -y \
    tar \
    libfontconfig \
    curl \
    ca-certificates \
    wget \
    sudo \
    procps
RUN wget $GRAFANA_URL$GRAFANA_PACK && \
    dpkg -i $GRAFANA_PACK && rm -f $GRAFANA_PACK

EXPOSE 3000

COPY ./start.sh /bin/start.sh
WORKDIR /usr/share/grafana

#ENTRYPOINT /bin/start.sh
CMD ["/bin/bash", "/bin/start.sh"]
