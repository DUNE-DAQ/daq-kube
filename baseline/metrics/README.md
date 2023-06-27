# Kubernetes base metrics

This folder contains metrics resources for the cluster itself.

These come in two forms:

## Kubernetes metrics for Kubernetes

The `metrics-server` provides kubernetes metrics about itself.

## Kubernetes metrics for Prometheus

The `kube-state-metrics` exports metrics from `metrics-server` for use by Prometheus.

The `prometheus-node-exporter` exports metrics from the nodes running Kubernetes for use by Prometheus.
