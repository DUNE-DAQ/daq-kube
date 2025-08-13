#!/bin/bash

NAMESPACE="ers"
CLUSTER="ers-database"

echo "--------------------------------------------------"
kubectl get namespaces | grep -q ${NAMESPACE}
if [[ $? -eq 0 ]]; then
    URI_RW=$(
        kubectl -n ${NAMESPACE} get secret ${CLUSTER}-ers-password -ojsonpath="{.data.uri}" | base64 --decode;
        echo
    )
    URI_RO=$(
        kubectl -n ${NAMESPACE} get secret ${CLUSTER}-readonly-password -ojsonpath="{.data.uri}" | base64 --decode;
        echo
    )

    echo "DUNE DAQ ERS Service Database URI:"
    echo "  Read-Write URI in cluster: ${URI_RW}"
    echo "  Read-Only URI in cluster : ${URI_RO}"
else
    echo "Kubernetes namespace ${NAMESPACE} does not exist"
fi
echo "--------------------------------------------------"
