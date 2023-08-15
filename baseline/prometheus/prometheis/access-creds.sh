#!/bin/bash

NAMESPACE="monitoring"

printf "%0.s-" {1..50}
echo ""
echo "Prometheus Servers:"
for prom in $(kubectl -n ${NAMESPACE} --no-headers=true get prometheus -o custom-columns=":metadata.name"); do
  echo "  URL in cluster: http://${prom}.${NAMESPACE}.svc:9090"
done
printf "%0.s-" {1..50}
echo ""
