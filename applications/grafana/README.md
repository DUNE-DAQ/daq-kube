# grafana

## grafana-server-main

We have defined top level variables in `variables/grafana_labels.yaml` which can be applied to secrets or configmaps to import dashboards, alerts, and datasources automatically into grafana.

The folder of a dashboard can be further controlled via the `grafana_dashboard_folder_annotation` value.

The default password of the grafana instance can be set via `grafana_admin_password` argument.

You should add datasources along side the application that creates them.

### kubernetes dashboards

This folder includes a number of well regarded kubernetes dashboards that are loaded into grafana automatically for you.

## grafana-server-devel

This is a playground environment for testing the development of new dashboards.
