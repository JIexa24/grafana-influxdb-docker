#!/bin/sh

exec /usr/sbin/grafana-server                               \
  --homepath="$GRAFANA_HOME"                                \
  --config="$GRAFANA_CONFIG"                                \
  "$@"                                                      \
  cfg:default.log.mode="console"                            \
  cfg:default.paths.data="$GRAFANA_DATA"                    \
  cfg:default.paths.logs="$GRAFANA_LOGS"                    \
  cfg:default.paths.plugins="$GRAFANA_PLUGINS"              \
  cfg:default.paths.provisioning="$GRAFANA_PROVISIONING"