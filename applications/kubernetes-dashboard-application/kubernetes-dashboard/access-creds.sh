#!/bin/bash

NAMESPACE="kubernetes-dashboard"
HELM_RELEASE="kubernetes-dashboard"

echo "--------------------------------------------------"
kubectl get namespaces | grep -q ${NAMESPACE}
if [[ $? -eq 0 ]]; then
    echo "Kubernetes Dashboard application:"
    echo "  URL in cluster: https://${HELM_RELEASE}.${NAMESPACE}.svc"
    echo '  Read Only Access token command: kubectl -n kubernetes-dashboard get secret kubernetes-dashboard-read-only-token -o jsonpath="{.data.token}" | base64 --decode ; echo'
else
    echo "Kubernetes namespace ${NAMESPACE} does not exist"
fi
echo "--------------------------------------------------"
