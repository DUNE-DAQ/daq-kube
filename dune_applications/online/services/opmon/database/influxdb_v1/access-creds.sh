#!/bin/bash

NAMESPACE="opmon"
HELM_RELEASE="opmon-influxdb"

echo "--------------------------------------------------"
kubectl get namespaces | grep -q ${NAMESPACE}
if [[ $? -eq 0 ]]; then
    URI_RW=$(
        kubectl -n ${NAMESPACE} get secret influxdbv1-readwrite-password -ojsonpath="{.data.uri}" | base64 --decode;
        echo
    )
    URI_RO=$(
        kubectl -n ${NAMESPACE} get secret influxdbv1-readonly-password -ojsonpath="{.data.uri}" | base64 --decode;
        echo
    )

    echo "DUNE DAQ OpMon Service InfluxDB v1:"
    echo "  Read-Write URI in cluster: ${URI_RW}"
    echo "  Read-Only URI in cluster:  ${URI_RO}"
else
    echo "Kubernetes namespace ${NAMESPACE} does not exist"
fi
echo "--------------------------------------------------"
