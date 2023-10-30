#!/bin/bash

NAMESPACE="daqconfig"

kubectl -n ${NAMESPACE} >/dev/null
echo "--------------------------------------------------"
echo "DUNE DAQ Config Service Mongo Express:"
echo "  URL in cluster: http://mongodb-express.${NAMESPACE}.svc:8081"
echo "--------------------------------------------------"
