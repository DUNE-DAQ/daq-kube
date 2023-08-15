#!/bin/bash

NAMESPACE="tinyproxy"
HELM_RELEASE="tinyproxy"

echo "--------------------------------------------------"
echo "TinyProxy application:"
echo "  URL in cluster: socks5://${HELM_RELEASE}.${NAMESPACE}.svc:1080"
echo "--------------------------------------------------"
