#!/bin/bash

NAMESPACE="daqconfig"
HELM_RELEASE="daqconfig-mongodb"

DATABASE=$(kubectl -n ${NAMESPACE} get secret ${HELM_RELEASE}-svcbind-0 -ojsonpath="{.data.database}" | base64 --decode; echo)
HOST=$(kubectl -n ${NAMESPACE} get secret ${HELM_RELEASE}-svcbind-0 -ojsonpath="{.data.host}" | base64 --decode; echo)
PASS=$(kubectl -n ${NAMESPACE} get secret ${HELM_RELEASE}-svcbind-0 -ojsonpath="{.data.password}" | base64 --decode; echo)
PORT=$(kubectl -n ${NAMESPACE} get secret ${HELM_RELEASE}-svcbind-0 -ojsonpath="{.data.port}" | base64 --decode; echo)
USER=$(kubectl -n ${NAMESPACE} get secret ${HELM_RELEASE}-svcbind-0 -ojsonpath="{.data.username}" | base64 --decode; echo)

echo "--------------------------------------------------"
echo "DUNE DAQ Config Service MongoDB:"
echo "  URI in cluster: mongodb://${USER}:${PASS}@${HOST}.${NAMESPACE}.svc:${PORT}/${DATABASE}"
echo "--------------------------------------------------"
