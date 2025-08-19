#!/bin/bash

echo "--------------------------------------------------"
echo "Node Ports deployed:"
kubectl get svc --all-namespaces -o jsonpath='{range .items[?(@.spec.type=="NodePort")]}{.metadata.name}.{.metadata.namespace}.svc is : {range .spec.ports[*]}{.nodePort}{"\n"}{end}{end}' | sort
echo ""
echo "NOTE: nodePorts CANNOT be used for internal cluster traffic"
echo "--------------------------------------------------"
