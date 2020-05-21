#!/bin/sh

if [ ! -z "${GRAFANA_INSTALL_PLUGINS}" ]; then
  OLDIFS=$IFS
  IFS=','
  for plugin in ${GRAFANA_INSTALL_PLUGINS}; do
    IFS=$OLDIFS
    grafana-cli --pluginsDir "${GRAFANA_PLUGINS}" --config="$GRAFANA_CONFIG" \
    plugins install ${plugin}
  done
fi

if [ "$1" = "/bin/start.sh" ]; then
  if [ "$(id -u)" = "0" ]; then
    exec gosu grafana "$@"
  fi
fi
exec "$@"