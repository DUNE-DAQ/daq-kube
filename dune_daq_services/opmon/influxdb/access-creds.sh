#!/bin/bash

NAMESPACE="opmon"
HELM_RELEASE="opmon-influxdb"

DATABASE="influxv4"
HOST=${HELM_RELEASE}
PASS=$(kubectl -n ${NAMESPACE} get secret ${HELM_RELEASE}-auth -ojsonpath="{.data.influxdb-password}" | base64 --decode; echo)
PORT="8086"
USER=$(kubectl -n ${NAMESPACE} get secret ${HELM_RELEASE}-auth -ojsonpath="{.data.influxdb-user}" | base64 --decode; echo)

echo "--------------------------------------------------"
echo "DUNE DAQ OpMon Service InfluxDB:"
echo "  URI in cluster: influxdb://${USER}:${PASS}@${HOST}.${NAMESPACE}.svc:${PORT}/${DATABASE}"
echo "--------------------------------------------------"
