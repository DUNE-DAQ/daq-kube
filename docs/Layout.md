## Repo Layout

You are expected to be familiar with https://kluctl.io/docs and its reference sections.

Where possible we are using the kluctl helm integration to rely on upstream packaging of resources.

In general each resource should have its own dedicated variables under the `variables` directory.

All kluctl target arguments should have default values.

### .helm-charts

Kluctl caches helm charts it uses locally, this is where the cache lives.

### .submodules

This contains all the submodule git repos we are including.  Specific elements from them should be linked into place so folks don't need to hunt for what repos we depend upon.

### Bootstrap

This contains the bare minimum for running a kubernetes cluster.

Mostly it is just the CNI.

### Baseline

Items in baseline should be deployed on all clusters and are the expected minimal feature set of our clusters.

This is a somewhat opinionated feature list.

#### Example

The `baseline/metrics` folder contains:

* kubernetes `metrics-server` for providing kubernetes metrics to kubernetes
* kubernetes prometheus exporter (`kube-state-metrics`) for providing kubernetes metrics to prometheus
* `prometheus-node-exporter` for providing host metrics to prometheus

### Operators

The [kubernetes operator pattern](https://kubernetes.io/docs/concepts/extend-kubernetes/operator/) is a useful way to deploy highly complex applications with clear integration points.

When an operator is maintained by a healthy community it should be strongly considered before using a helm manifest for the application.  The end of the influxdb operator is a point of worry.

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

### Node-ports

This is where DUNE Node Ports are kept.  By putting them in one place, we hope to make management and allocation easier.

## HOW TO

See the `docs` directory for individual instructions.
