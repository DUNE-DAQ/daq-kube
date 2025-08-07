#!/bin/bash

NAMESPACE="kafka"
RELEASE="dune-daq"

echo "--------------------------------------------------"
kubectl get namespaces | grep -q ${NAMESPACE}
if [[ $? -eq 0 ]]; then
    echo "DUNE DAQ Kafka Service:"
    echo "  URL in cluster: kafka://${RELEASE}-kafka-bootstrap.${NAMESPACE}.svc:9092"
    echo "  URL in cluster: kafka+tls://${RELEASE}-kafka-bootstrap.${NAMESPACE}.svc:9093"
else
    echo "Kubernetes namespace ${NAMESPACE} does not exist"
fi
echo "--------------------------------------------------"
