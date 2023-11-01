## Grafana

You can set the grafana password with `kluctl deploy -a grafana_admin_password=mypassword`.

It should be running in cluster at https://grafana.monitoring.svc/

### Configuration
The grafana container we are using has the ability to dynamically import items.

To add a new datasource build a config map like:

```
---
apiVersion: v1
kind: Secret
metadata:
  name: grafana-datasource-postgresqlers
  namespace: monitoring
  labels:
     {{ grafana_datasource_label_name }}: {{ grafana_datasource_label_value }}
type: Opaque
stringData:
  postgresqlers.yaml: |-
    apiVersion: 1
    datasources:
    - name: PostgresERS
      type: postgres
      url: np04-srv-000.cern.ch:65432
      access: proxy
      database: ApplicationDbErrorReporting
      jsonData:
        sslmode: "disable" # this breaks my heart
        tlsSkipVerify: true # this breaks my heart
        postgresVersion: 1200
        maxIdleConns: 2
      user: admin
      secureJsonData:
        password: puttherealpasswordhere # this note example doesn't have the password, but your secret should
```

The `{{ grafana_datasource_label_name }}: {{ grafana_datasource_label_value }}` elements are expanded by kluctl to their values from the `variables`.

The process is similar for datasources as well.  To control what folder a dashboard goes into use `{{ grafana_dashboard_folder_annotation }}: MYFOLDER`.
