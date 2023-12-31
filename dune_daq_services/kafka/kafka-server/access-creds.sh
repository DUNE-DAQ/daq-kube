#!/bin/bash

NAMESPACE="kafka"
RELEASE="dune-daq"

kubectl -n ${NAMESPACE} get pods >/dev/null
echo "--------------------------------------------------"
echo "DUNE DAQ Kafka Service:"
echo "  URL in cluster: kafka://${RELEASE}-kafka-bootstrap.${NAMESPACE}.svc:9092"
echo "  URL in cluster: kafka+tls://${RELEASE}-kafka-bootstrap.${NAMESPACE}.svc:9093"
echo "--------------------------------------------------"
