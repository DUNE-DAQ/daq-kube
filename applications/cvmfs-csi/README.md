# CVMFS CSI

Our deployment here does not include any default CVMFS volumes.

Those should be deployed with the environments that need them as each `PVC` is local to its own namespace.

The `storageClass`, however, is not namespaced.  It should still be declared with the DAQ code to keep this installation as generic as possible.
