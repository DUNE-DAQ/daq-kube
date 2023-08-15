#!/bin/bash

NAMESPACE="monitoring"

printf "%0.s-" {1..50}
echo ""
echo "Prometheus Servers:"
for prom in $(kubectl -n ${NAMESPACE} --no-headers=true get prometheus -o custom-columns=":metadata.name"); do
  svc_name=$(kubectl -n ${NAMESPACE} --no-headers=true get service -l app=prometheus-${alert} -o custom-columns=":metadata.name")
  echo "  URL in cluster for ${prom}: http://${svc_name}.${NAMESPACE}.svc:9090"
done
printf "%0.s-" {1..50}
echo ""
