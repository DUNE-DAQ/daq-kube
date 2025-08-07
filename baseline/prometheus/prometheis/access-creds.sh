#!/bin/bash

NAMESPACE="monitoring"

echo "--------------------------------------------------"
kubectl get namespaces | grep -q ${NAMESPACE}
if [[ $? -eq 0 ]]; then
    echo "Prometheus Servers:"
    for prom in $(kubectl -n ${NAMESPACE} --no-headers=true get prometheus -o custom-columns=":metadata.name"); do
        svc_name=$(kubectl -n ${NAMESPACE} --no-headers=true get service -l "app=prometheus-${prom}" -o custom-columns=":metadata.name")
        echo "  URL in cluster for ${prom}: http://${svc_name}.${NAMESPACE}.svc:9090"
    done
else
    echo "Kubernetes namespace ${NAMESPACE} does not exist"
fi
echo "--------------------------------------------------"
