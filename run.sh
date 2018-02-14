#!/bin/bash
set -ex

NODE_LIST="${NODE_LIST:-http://172.18.0.1:14265}"

cat <<EOF > config.ini
[nodes]
sync_check_interval = ${SYNC_CHECK_INTERVAL:-600}
node_list = ${NODE_LIST}
third_party_node_list = ${THIRD_PARTY_NODE_LIST:-true}

[log]
interval = ${INTERVAL:-60}
time_format = ${TIME_FORMAT:-HH:mm:ss}

[spamfund]
email = ${EMAIL}
password = ${PASSWORD}

[threads]
amount = ${THREADS_AMOUNT:-1}
priority = ${THREADS_PRIORITY:-2}
EOF

curl ${NODE_LIST}

exec java -jar target/isf-jclient-1.0.3.jar start
