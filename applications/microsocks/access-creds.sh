#!/bin/bash

NAMESPACE="microsocks"
HELM_RELEASE="microsocks"

echo "--------------------------------------------------"
kubectl get namespaces | grep -q ${NAMESPACE}
if [[ $? -eq 0 ]]; then
    echo "Microsocks application:"
    echo "  URL in cluster: socks5://${HELM_RELEASE}.${NAMESPACE}.svc:1080"
else
    echo "Kubernetes namespace ${NAMESPACE} does not exist"
fi
echo "--------------------------------------------------"
