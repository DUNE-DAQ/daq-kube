#!/bin/bash

NAMESPACE="kafka"
RELEASE="kafka-ui"

echo "--------------------------------------------------"
kubectl get namespaces | grep -q ${NAMESPACE}
if [[ $? -eq 0 ]]; then
    echo "DUNE DAQ Kafka Service Web UI:"
    echo "  URL in cluster: http://${RELEASE}.${NAMESPACE}.svc"
else
    echo "Kubernetes namespace ${NAMESPACE} does not exist"
fi
echo "--------------------------------------------------"
