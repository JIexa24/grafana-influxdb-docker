FROM debian:latest
MAINTAINER Alexey Romanuta R9ODT

RUN apt-get update
RUN DEBIAN_FRONTEND=noninteractive apt-get install influxdb influxdb-client sudo vim nano -y

COPY ./start.sh /bin/start.sh

EXPOSE 8086

ENTRYPOINT /bin/start.sh
