#!/bin/bash

NAMESPACE="monitoring"
HELM_RELEASE="grafana-devel"

ADMIN_USER=$(kubectl -n ${NAMESPACE} get secret ${HELM_RELEASE} -ojsonpath='{.data.admin-user}' | base64 --decode; echo)
ADMIN_PASS=$(kubectl -n ${NAMESPACE} get secret ${HELM_RELEASE} -ojsonpath='{.data.admin-password}' | base64 --decode; echo)

echo "--------------------------------------------------"
echo "Grafana Development server:"
echo "  URL in cluster: http://${HELM_RELEASE}.${NAMESPACE}.svc"
echo "  Username: ${ADMIN_USER}"
echo "  Password: ${ADMIN_PASS}"
echo "--------------------------------------------------"
