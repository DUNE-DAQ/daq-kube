## Using cvmfs-csi

A CVMFS repository must be bound explicitly by the CSI driver.
Mounting the generic cvmfs StorageClass on /cvmfs only exposes
/etc/auto.cvmfs and does not provide repository contents.

Repositories must be specified via:
- inline CSI volume (volumeAttributes.repo), or
- StorageClass parameters.repo

Volumes must always be mounted at /cvmfs.
