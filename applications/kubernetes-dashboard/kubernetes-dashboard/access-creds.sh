#!/bin/bash

NAMESPACE="kubernetes-dashboard"
HELM_RELEASE="kubernetes-dashboard"

echo "--------------------------------------------------"
echo "Kubernetes Dashboard application:"
echo "  URL in cluster: https://${HELM_RELEASE}.${NAMESPACE}.svc"
echo "--------------------------------------------------"
