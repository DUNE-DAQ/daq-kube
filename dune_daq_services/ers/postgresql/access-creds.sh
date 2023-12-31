#!/bin/bash

NAMESPACE="ers"
HELM_RELEASE="ers-postgresql"

DATABASE=$(kubectl -n ${NAMESPACE} get secret ${HELM_RELEASE}-svcbind-custom-user -ojsonpath="{.data.database}" | base64 --decode; echo)
HOST=$(kubectl -n ${NAMESPACE} get secret ${HELM_RELEASE}-svcbind-custom-user -ojsonpath="{.data.host}" | base64 --decode; echo)
PASS=$(kubectl -n ${NAMESPACE} get secret ${HELM_RELEASE}-svcbind-custom-user -ojsonpath="{.data.password}" | base64 --decode; echo)
PORT=$(kubectl -n ${NAMESPACE} get secret ${HELM_RELEASE}-svcbind-custom-user -ojsonpath="{.data.port}" | base64 --decode; echo)
USER=$(kubectl -n ${NAMESPACE} get secret ${HELM_RELEASE}-svcbind-custom-user -ojsonpath="{.data.username}" | base64 --decode; echo)

echo "--------------------------------------------------"
echo "DUNE DAQ ERS Service PostgreSQL:"
echo "  URI in cluster: postgresql://${USER}:${PASS}@${HOST}.${NAMESPACE}.svc:${PORT}/${DATABASE}"
echo "--------------------------------------------------"
