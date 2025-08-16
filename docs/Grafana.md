## Grafana

You can get the grafana password with `kubectl -n monitoring get secret grafana-admin -o jsonpath='{.data.admin-password}' | base64 -d ; echo`

It should be running in cluster at http://grafana.monitoring.svc/

### Configuration

The grafana container we are using has the ability to dynamically import items.

To add a new datasource build a `secret` like what is found in [`baseline/prometheus/prometheis/prometheus_grafana_datasource.yml`](https://github.com/DUNE-DAQ/daq-kube/blob/develop/baseline/prometheus/prometheis/prometheus_grafana_datasource.yml)

Dashboards can be automatically imported and inserted into folders. See [`applications/grafana/grafana-dashboards-rfmoz/kustomization.yml`](https://github.com/DUNE-DAQ/daq-kube/blob/develop/applications/grafana/grafana-dashboards-rfmoz/kustomization.yml)
