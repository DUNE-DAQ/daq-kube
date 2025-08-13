#!/bin/bash

echo "FIXME: query the cluster to see what we loaded?"
echo "--------------------------------------------------"
echo "Node Ports allocated:"
(
    cd $(dirname $0)
    for port in $(grep nodePort *.yaml | tr -d ' ' | tr -d '#'); do
        NAME=$(echo $port | sed -e 's/\.yaml:nodePort:/ is /')
        echo "  ${NAME}"
    done
)
echo ""
echo "NOTE: nodePorts CANNOT be used for internal cluster traffic"
echo "--------------------------------------------------"
