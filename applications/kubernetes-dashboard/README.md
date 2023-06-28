# kubernetes-dashboard

The kubernetes management dashboard is a UI for looking at the cluster state.

There are two local variables you should be aware of `kubernetes_dashboard.disable_ro_user` and `kubernetes_dashboard.deny_all_ingress`. Setting these to `true` is the best practice for securing the kubernetes dashboard.
