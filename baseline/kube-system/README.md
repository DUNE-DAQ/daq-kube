# kube-system alterations

We are setting some optional fields on the `kube-system` namespace to ensure we do not break the cluster by mistake.

* `kluctl.io/skip-delete: "true"` - Do not let `kluctl` delete this object
* `pod-security.kubernetes.io/enforce: privileged` - If kubernetes tries to apply the pod security standards to this namespace, ensure the highest priviledges are granted. Otherwise your cluster will not work.
