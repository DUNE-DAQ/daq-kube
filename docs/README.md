# daq-kube

This repository contains kubernetes deployment objects for our DAQ style environments.

## Setup

Setting up your system and cluster to use this repo has a few steps:

### Set your kubernetes roles on your worker nodes

This repo expects you to use the `node-role.kubernetes.io/rolename` labels to control where pods are run.

By default most things use `node-role.kubernetes.io/worker` which you can set with:

```
kubectl label node mynode node-role.kubernetes.io/worker=worker
```

Users of [pocket](https://github.com/DUNE-DAQ/pocket) will have the worker label set automatically.

The actual value of the label isn't checked, just if it exists. Some DAQ targets will use a different label.

### Clone the repo

This repository uses submodules to track external repos. To clone this repository you should use:

```shell
git clone https://github.com/DUNE-DAQ/daq-kube.git --recursive --depth 1
```

**OR**

```shell
git clone https://github.com/DUNE-DAQ/daq-kube.git ; cd daq-kube ; git submodule update --init
```

This will pull down a number of external repositories and set them up as expected.

### Fetch kluctl

This repository makes use of [kluctl](https://kluctl.io) to provide flexible environments (aka. targets).

To load the `kluctl` tool please follow https://kluctl.io/docs/kluctl/installation/ to get the binary.

Users of [pocket](https://github.com/DUNE-DAQ/pocket) will have this downloaded automatically.

## Select your target and deploy

**_NOTE:_** when setting the `user_password` to non-default values you should use an args-file. You can provide a set of arguments via a yaml file: `kluctl deploy -t target --args-from-file=filename.yaml`. This will prevent the password from being stored in shell history.

The `.kluctl.yaml` file lists the deployment targets we've configured. The `context` keyword ensures that `kluctl` will use the specified [kubectl context](https://kubernetes.io/docs/tasks/access-application-cluster/configure-access-multiple-clusters/) to deploy the manifests.

**_NOTE:_** You cannot deploy a target to a kubernetes context other than the one defined in `.kluctl.yaml`. You may need to rename or set you kubernetes context in `~/.kube/config`.

For example:

```shell
kluctl deploy -t pocket
```

or:

```shell
kluctl render -t pocket --offline-kubernetes
```

To see what targets are defined you can run `kluctl list-targets --only-names` to see the `name` and defaults for each target.

For example, to just deploy the `baseline` cluster services to `pocket`:

```shell
kluctl deploy -t pocket-baseline
```

## Access to your cluster

You can review the default credentials for your cluster by running when `kubectl` is in your `$PATH` and has this cluster as the default context with:

```shell
print-creds.sh
```

The deployment also sets up an instance of a `microsocks` SOCKS5 proxy server that you can use to tie into the kubernetes network.

### Node Ports

The list of node-ports in use can be found under `node-ports`. It contains the exact manifests being run and should thus be the most up to date list of node-ports. These are controled with `kluctl` variables.

### Proxy

Inside the cluster, port `1080` is available for use as a SOCKS5 proxy.

If the node-ports were deployed, there is a node-port set for `microsocks` that should grant access to the cluster. If you delegate DNS to the SOCKS5 proxy, you can use this proxy server to test and recieve any in-cluster resources.

## HOW TO

See the [docs](https://github.com/DUNE-DAQ/daq-kube/tree/develop/docs) directory for instructions on individual components.
