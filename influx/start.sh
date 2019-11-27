#!/bin/sh
chown -R influxdb: /var/lib/influxdb
exec sudo -u influxdb influxd;
