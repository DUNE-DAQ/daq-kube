# kube-prometheus-stack

We are using Prometheus to monitor the kubernetes infrastructure. Upstream has a lot invested in Prometheus-Operator. Kube-prometheus-stack is a project to package up the Prometheus-Operator in Helm.

Once the Prometheus-Operator is deployed, we can create `Prometheus` and `Alertmanger` resources that will automatically deploy according to the current best practices.

We can then deploy various `Rules` and `Monitors` to let each service describe how it wants to be monitored along side that code rather than centralize it here.

The `variables` provided should in theory make it easy to add dedicated instances with specific filters.

The lables are kept in the global namespace under `variables/alertmanager_labels.yaml` and `variables/prometheus_labels.yaml`.

The "default" prometheus is available within the cluster under the name `prometheus.monitoring.svc` on port 9090
The "default" alertmanager is available within the cluster under the name `alertmanager.monitoring.svc` on port 9093
