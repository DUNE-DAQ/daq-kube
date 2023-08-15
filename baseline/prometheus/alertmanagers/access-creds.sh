#!/bin/bash

NAMESPACE="monitoring"

echo "--------------------------------------------------"
echo "Prometheus Alert Managers:"
for alerts in $(kubectl -n ${NAMESPACE} --no-headers=true get alertmanager -o custom-columns=":metadata.name"); do
  svc_name=$(kubectl -n ${NAMESPACE} --no-headers=true get service -l "app=alertmanager-${alerts}" -o custom-columns=":metadata.name")
  echo "  URL in cluster for ${alerts}: http://${svc_name}.${NAMESPACE}.svc:9093"
done
echo "--------------------------------------------------"
