# DNS Autoscaler

DNS is the heart of kubernetes service discovery. If this service gets overloaded, spin up additional containers - to a point.

This requires a working copy of the `metrics-server` for the Horizontal Pod Autoscaler to work.
