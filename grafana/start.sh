#!/bin/sh

if [ ! -z "${GRAFANA_INSTALL_PLUGINS}" ]; then
  OLDIFS=$IFS
  IFS=','
  for plugin in ${GRAFANA_INSTALL_PLUGINS}; do
    IFS=$OLDIFS
    grafana-cli --pluginsDir "${GF_PLUGIN_DIR}" --config="$GRAFANA_CONFIG" \
    plugins install ${plugin}
  done
fi

exec /usr/sbin/grafana-server                               \
  --homepath="$GRAFANA_HOME"                                \
  --config="$GRAFANA_CONFIG"                                \
  "$@"                                                      \
  cfg:default.log.mode="console"                            \
  cfg:default.paths.data="$GRAFANA_DATA"                    \
  cfg:default.paths.logs="$GRAFANA_LOGS"                    \
  cfg:default.paths.plugins="$GF_PLUGIN_DIR"              \
  cfg:default.paths.provisioning="$GRAFANA_PROVISIONING"