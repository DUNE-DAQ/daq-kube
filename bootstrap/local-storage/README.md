# local path provisioner

The kubernetes `hostPath` provisioner is complex to switch in and out of.

The `local-path-provisioner` functions in the same way, but it uses `storageClasses` to permit easily trading out various backends.

See the `variables` and `helm-values` for defaults being set.
