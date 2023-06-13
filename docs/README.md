# daq-kube

This repository contains kubernetes deployment objects for our DAQ environments.

## Setup

Setting up your system to use this repo has a few steps:

### Clone the repo
This repository uses submodules to track external repos.  To clone this repository you should use:

```shell
git clone https://github.com/DUNE-DAQ/daq-kube.git --recursive
```

This will pull down a number of external repositories and set them up as expected.

### Fetch kluctl

This repository makes use of [kluctl](https://kluctl.io) to provide flexible environments (aka. targets).

To load the `kluctl` tool please follow https://kluctl.io/docs/kluctl/installation/ to get the binary.

### Select your target

The `.kluctl.yaml` file lists the deployment targets we've configured.  The `context` keyword ensures that `kluctl` will use the specified [kubectl context](https://kubernetes.io/docs/tasks/access-application-cluster/configure-access-multiple-clusters/) to deploy the manifests.

***NOTE:*** You cannot deploy a target to a context other than the one defined in `.kluctl.yaml`.

To see what targets are defined you can run `kluctl list-targets`.

For example: `kluctl deploy -t pocket`

## Layout

You are expected to be familiar with https://kluctl.io/docs and its reference sections.

Where possible we are using the kluctl helm integration to rely on upstream packaging of resources.

In general each resource should have its own dedicated variables under the `variables` directory.

All kluctl target arguments should have default values.

### Baseline

Items in baseline should be deployed on all clusters and are the expected minimal feature set of our clusters.

This is a somewhat opinionated feature list.

#### Example

The `baseline/metrics` folder contains:

* kubernetes metrics-server for providing kubernetes metrics to kubernetes
* kubernetes prometheus exporter (kube-state-metrics) for providing kubernetes metrics to prometheus
* prometheus-node-exporter for providing host metrics to prometheus

### Operators

The (kubernetes operator pattern)[https://kubernetes.io/docs/concepts/extend-kubernetes/operator/] is a useful way to deploy highly complex applications with clear integration points.

When an operator is maintained by a healthy community it should be strongly considered before using a helm manifest for the application.

It should be safe to deploy operators on all clusters even if you do not intend to use its feature set.  Each operator has a resource cost.

### Applications

These are items that external communities are maintaining.

Applications are optional components of the cluster.  Odds are you'll want them, but they should be controlled via arguments.  They should be treated similarly to feature flags from `autoconf` so there is an obvious method for enabling or disabling a specific application.

#### Example

the `applications/grafana` folder contains:

* the grafana-server
* dashboards for kubernetes components from two different upstream projects

### DUNE\_DAQ

This is where DUNE specific applications, utilities, dashboards, etc should be placed.

Ideally each subsystem will have a subdirectory that contains its own items.

## HOW TO

### Grafana

You can set the grafana password with `kluctl deploy -a grafana_admin_password=mypassword`.

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

### Prometheus

You'll need to read up on https://prometheus-operator.dev/

The important variables are provided in the variables file.

The "main" prometheus deployed in this repository will track all `serviceMonitor`, `podMonitor`, `probe`, and `prometheusRule` resources.
