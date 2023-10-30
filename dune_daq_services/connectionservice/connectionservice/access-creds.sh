#!/bin/bash

NAMESPACE="connections"

kubectl -n ${NAMESPACE} >/dev/null
echo "--------------------------------------------------"
echo "DUNE DAQ Connection Service:"
echo "  URL in cluster: https://connectionservice.${NAMESPACE}.svc:5000"
echo "--------------------------------------------------"
