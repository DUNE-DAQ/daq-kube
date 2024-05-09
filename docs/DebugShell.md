# To spawn a debug busybox:

```shell
kubectl --namespace debug run -i --tty --rm debug --image=docker.io/library/busybox:latest --restart=Never -- sh
```
