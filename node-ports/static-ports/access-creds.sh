#!/bin/bash

echo "--------------------------------------------------"
echo "DUNE DAQ Node Ports for Cluster:"
(
 cd $(dirname $0)
 for port in $(grep nodePort *.yaml | tr -d ' ' | tr -d '#'); do
  NAME=$(echo $port | sed -e 's/\.yaml:nodePort:/ is /')
  echo "  ${NAME}"
 done
)
echo "--------------------------------------------------"
