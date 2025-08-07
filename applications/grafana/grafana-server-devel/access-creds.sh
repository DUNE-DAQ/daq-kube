#!/bin/bash

NAMESPACE="monitoring"
HELM_RELEASE="grafana-devel"

echo "--------------------------------------------------"
kubectl get namespaces | grep -q ${NAMESPACE}
if [[ $? -eq 0 ]]; then
    ADMIN_USER=$(
        kubectl -n ${NAMESPACE} get secret grafana-admin -ojsonpath='{.data.admin-user}' | base64 --decode;
        echo
    )
    ADMIN_PASS=$(
        kubectl -n ${NAMESPACE} get secret grafana-admin -ojsonpath='{.data.admin-password}' | base64 --decode;
        echo
    )

    echo "Grafana Development server:"
    echo "  URL in cluster: http://${HELM_RELEASE}.${NAMESPACE}.svc"
    echo "  Username: ${ADMIN_USER}"
    echo "  Password: ${ADMIN_PASS}"
else
    echo "Kubernetes namespace ${NAMESPACE} does not exist"
fi
echo "--------------------------------------------------"
