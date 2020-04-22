FROM debian:buster
LABEL Author="Alexey Romanuta R9ODT"

ARG INFLUX_VERSION=1.6.4-1+b22

RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y \
    sudo \
    vim \
    nano \
    procps

RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y \
    influxdb=${INFLUX_VERSION} \
    influxdb-client=${INFLUX_VERSION} 

EXPOSE 8086
COPY ./start.sh /bin/start.sh

#ENTRYPOINT /bin/start.sh
CMD ["/bin/bash", "/bin/start.sh"]

