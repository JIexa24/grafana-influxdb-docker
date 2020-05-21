#!/bin/sh

if [ "$1" = "/bin/start.sh" ]; then
  if [ "$(id -u)" = "0" ]; then
    exec gosu influxdb "$@"
  fi
fi
exec "$@"