#!/bin/bash

NAMESPACE="connections"

echo "--------------------------------------------------"
kubectl get namespaces | grep -q ${NAMESPACE}
if [[ $? -eq 0 ]]; then
    echo "DUNE DAQ Connection Service:"
    echo "  URL in cluster: https://connectionservice.${NAMESPACE}.svc:5000"
else
    echo "Kubernetes namespace ${NAMESPACE} does not exist"
fi
echo "--------------------------------------------------"
