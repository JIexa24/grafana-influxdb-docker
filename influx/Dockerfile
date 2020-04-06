FROM debian:buster
LABEL Author="Alexey Romanuta R9ODT"

RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install influxdb influxdb-client sudo vim nano procps -y

COPY ./start.sh /bin/start.sh

EXPOSE 8086

#ENTRYPOINT /bin/start.sh
CMD ["/bin/bash", "/bin/start.sh"]

