NAMESPACE="monitoring"
HELM_RELEASE="grafana"

ADMIN_USER=$(kubectl -n ${NAMESPACE} get secret ${HELM_RELEASE} -ojsonpath='{data.admin-user}' | base64 --decode; echo)
ADMIN_PASS=$(kubectl -n ${NAMESPACE} get secret ${HELM_RELEASE} -ojsonpath='{data.admin-password}' | base64 --decode; echo)

echo ""
echo -e $(blue Grafana Main server:)
echo    "  URL in cluster: http://grafana.monitoring.svc"
echo -e "  $(bold Username:) ${ADMIN_USER}"
echo -e "  $(bold Password:) ${ADMIN_PASS}"
printf "%0.s-" {1..30}
