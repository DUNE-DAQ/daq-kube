#!/bin/bash

NAMESPACE="monitoring"

printf "%0.s-" {1..50}
echo ""
echo "Prometheus Alert Managers:"
for alerts in $(kubectl -n ${NAMESPACE} --no-headers=true get alertmanager -o custom-columns=":metadata.name"); do
  echo "  URL in cluster: http://${alerts}.${NAMESPACE}.svc:9093"
done
printf "%0.s-" {1..50}
echo ""
