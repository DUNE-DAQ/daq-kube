#!/bin/bash

NAMESPACE="python-tiny-proxy"
HELM_RELEASE="python-tiny-proxy"

kubectl -n ${NAMESPACE} get pods >/dev/null
echo "--------------------------------------------------"
echo "Python Tiny-Proxy application:"
echo "  URL in cluster: socks5://${HELM_RELEASE}.${NAMESPACE}.svc:1080"
echo "--------------------------------------------------"
