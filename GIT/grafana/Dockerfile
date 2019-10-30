FROM debian:latest
MAINTAINER Alexey Romanuta R9ODT

ARG GRAFANA_URL="https://dl.grafana.com/oss/release/"
ARG GRAFANA_PACK="grafana_6.4.3_armhf.deb"

RUN apt-get update && apt-get install -qq -y tar libfontconfig curl ca-certificates wget sudo
RUN wget $GRAFANA_URL$GRAFANA_PACK && dpkg -i $GRAFANA_PACK && rm -f $GRAFANA_PACK

EXPOSE 3000

COPY ./start.sh /bin/start.sh
WORKDIR /usr/share/grafana
ENTRYPOINT /bin/start.sh
