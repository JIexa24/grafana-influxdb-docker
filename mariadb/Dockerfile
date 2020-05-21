FROM ubuntu:bionic
LABEL Author="Alexey Romanuta R9ODT"

ARG IMAGE_VERSION
ENV MARIADB_VERSION=${IMAGE_VERSION} \
    IMAGE_USER=mysql \
    GOSU_VERSION=1.12

RUN groupadd -g 1000 ${IMAGE_USER} && \
    useradd -m -d /var/lib/mysql -s /usr/sbin/nologin -g 1000 -u 1000 ${IMAGE_USER}
RUN mkdir -p /var/run/mysqld && chown -R mysql:mysql /var/run/mysqld
RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y \
    ca-certificates \
    wget \
    procps ; \
    rm -rf /var/lib/apt/lists/* /var/cache/apt
RUN dpkgArch="$(dpkg --print-architecture | awk -F- '{ print $NF }')"; \
	wget --no-verbose -O /usr/local/bin/gosu "https://github.com/tianon/gosu/releases/download/$GOSU_VERSION/gosu-$dpkgArch"; \
	chmod +x /usr/local/bin/gosu; \
	gosu --version; \
	gosu nobody true
RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y \
    mariadb-server=${IMAGE_VERSION} ; \
    rm -rf /var/lib/apt/lists/* /var/cache/apt

EXPOSE 3036
WORKDIR /var/lib/mysql

COPY ./docker-entrypoint.sh /bin/docker-entrypoint.sh
ENTRYPOINT ["/bin/docker-entrypoint.sh"]

COPY ./start.sh /bin/start.sh
CMD ["/bin/start.sh"]

