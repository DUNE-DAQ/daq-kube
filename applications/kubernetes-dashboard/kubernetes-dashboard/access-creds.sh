NAMESPACE="kubernetes-dashboard"
HELM_RELEASE="kubernetes-dashboard"

printf "%0.s-" {1..50}
echo ""
echo "Kubernetes Dashboard application:"
echo "  URL in cluster: https://${HELM_RELEASE}.${NAMESPACE}.svc"
printf "%0.s-" {1..50}
echo ""
