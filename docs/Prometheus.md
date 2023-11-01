## Prometheus/Alertmanager

It should be running in-cluster under the name `prometheus.monitoring.svc` at port 9090 and `alertmanager.monitoring.svc` at port 9093.

### Configuration

You'll need to read up on https://prometheus-operator.dev/

The important variables are provided in the variables file.

The "main" prometheus deployed in this repository will track all `serviceMonitor`, `podMonitor`, `probe`, and `prometheusRule` resources.
