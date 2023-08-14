NAMESPACE="tinyproxy"
HELM_RELEASE="tinyproxy"

printf "%0.s-" {1..50}
echo ""
echo "TinyProxy application:"
echo "  URL in cluster: socks5://${HELM_RELEASE}.${NAMESPACE}.svc:1080"
printf "%0.s-" {1..50}
echo ""
