#!/bin/bash

NAMESPACE="tinyproxy"
HELM_RELEASE="tinyproxy"

kubectl -n ${NAMESPACE} get pods >/dev/null
echo "--------------------------------------------------"
echo "TinyProxy application:"
echo "  URL in cluster: socks5://${HELM_RELEASE}.${NAMESPACE}.svc:1080"
echo "--------------------------------------------------"
