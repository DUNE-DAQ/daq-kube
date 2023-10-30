#!/bin/bash

NAMESPACE="daqconfig"

kubectl -n ${NAMESPACE} >/dev/null
echo "--------------------------------------------------"
echo "DUNE DAQ Config Service:"
echo "  URL in cluster: https://daqconfig.${NAMESPACE}.svc:5003"
echo "--------------------------------------------------"
