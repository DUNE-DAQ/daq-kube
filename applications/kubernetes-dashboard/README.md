# kubernetes-dashboard

The kubernetes management dashboard is a UI for looking at the cluster state.

It is available within the cluster under the name `kubernetes-dashboard.kubernetes-dashboard.svc` on port 443.

There are two local variables you should be aware of `kubernetes_dashboard.disable_ro_user` and `kubernetes_dashboard.deny_all_ingress`. Setting these to `true` is the best practice for securing the kubernetes dashboard.

When this goes to dashboard v3, there are a ton of changes I'm not ready for...

To get the read only user token:
```shell
kubectl -n kubernetes-dashboard get secret kubernetes-dashboard-read-only-token -o jsonpath="{.data.token}" | base64 --decode ; echo
```
