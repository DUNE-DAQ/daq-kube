#!/bin/bash

NAMESPACE="headlamp"
HELM_RELEASE="headlamp"

echo "--------------------------------------------------"
kubectl get namespaces | grep -q ${NAMESPACE}
if [[ $? -eq 0 ]]; then
    echo "Headlamp application:"
    echo "  URL in cluster: http://${HELM_RELEASE}.${NAMESPACE}.svc:80"
else
    echo "Kubernetes namespace ${NAMESPACE} does not exist"
fi
echo "--------------------------------------------------"
