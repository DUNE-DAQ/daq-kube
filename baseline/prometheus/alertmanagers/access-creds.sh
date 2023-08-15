#!/bin/bash

NAMESPACE="monitoring"

printf "%0.s-" {1..50}
echo ""
echo "Prometheus Alert Managers:"
for alerts in $(kubectl -n ${NAMESPACE} --no-headers=true get alertmanager -o custom-columns=":metadata.name"); do
  svc_name=$(kubectl -n ${NAMESPACE} --no-headers=true get service -l app=alertmanager-${alert} -o custom-columns=":metadata.name")
  echo "  URL in cluster for ${alerts}: http://${svc_name}.${NAMESPACE}.svc:9093"
done
printf "%0.s-" {1..50}
echo ""
