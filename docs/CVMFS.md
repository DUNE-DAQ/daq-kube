## Using cvmfs-csi

Essentially, just request a volume from the `storageClass: cvmfs` and ensure it is mounted on `/cvmfs`.

NOTE: if you use another path than `/cvmfs` it will not be accessible in the container.
