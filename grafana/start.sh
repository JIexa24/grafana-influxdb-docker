#!/bin/sh

if [ ! -z "${GF_INSTALL_PLUGINS}" ]; then
  OLDIFS=$IFS
  IFS=','
  for plugin in ${GF_INSTALL_PLUGINS}; do
    IFS=$OLDIFS
    grafana-cli --pluginsDir "${GF_PLUGIN_DIR}" --config="$GF_CONFIG" \
    plugins install ${plugin}
  done
fi

exec /usr/sbin/grafana-server                               \
  --homepath="$GF_HOME"                                \
  --config="$GF_CONFIG"                                \
  "$@"                                                      \
  cfg:default.log.mode="console"                            \
  cfg:default.paths.data="$GF_DATA"                    \
  cfg:default.paths.logs="$GF_LOGS"                    \
  cfg:default.paths.plugins="$GF_PLUGIN_DIR"              \
  cfg:default.paths.provisioning="$GF_PROVISIONING"