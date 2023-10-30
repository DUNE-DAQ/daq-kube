#!/bin/bash

NAMESPACE="kubernetes-dashboard"
HELM_RELEASE="kubernetes-dashboard"

kubectl -n ${NAMESPACE} get pods >/dev/null
echo "--------------------------------------------------"
echo "Kubernetes Dashboard application:"
echo "  URL in cluster: https://${HELM_RELEASE}.${NAMESPACE}.svc"
echo "--------------------------------------------------"
