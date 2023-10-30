#!/bin/bash

NAMESPACE="kafka"
RELEASE="kafka-ui"

kubectl -n ${NAMESPACE} >/dev/null
echo "--------------------------------------------------"
echo "DUNE DAQ Kafka Service Web UI:"
echo "  URL in cluster: http://${RELEASE}.${NAMESPACE}.svc"
echo "--------------------------------------------------"
