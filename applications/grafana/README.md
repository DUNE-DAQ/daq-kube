# grafana

## grafana-server-main

It is accessible within the cluster under the name `grafana.monitoring.svc` on port 3000.

We have defined top level variables in `variables/grafana_labels.yaml` which can be applied to secrets or configmaps to import dashboards, alerts, and datasources automatically into grafana.

The folder of a dashboard can be further controlled via the `grafana_dashboard_folder_annotation` value.

The default password of the grafana instance can be set via `grafana_admin_password` argument.

You should add datasources along side the application that creates them.

### kubernetes dashboards

This folder includes a number of well regarded kubernetes dashboards that are loaded into grafana-main automatically for you.

## grafana-server-devel

This is a playground environment for testing the development of new dashboards.

It is accessible within the cluster under the name `grafana-devel.monitoring.svc` on port 3000.

To load a dashboard ConfigMap into grafana-devel as well, add the `{{ grafana_devel_dashboard_label_name }}: {{ grafana_dashboard_label_value }}` label next to the regular dashboard label.
