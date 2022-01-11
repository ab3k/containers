# Debian for toolbox

```
podman build -t debian-toolbox -f Dockerfile.debian
toolbox create -i localhost/debian-toolbox:latest
toolbox enter debian-toolbox-latest
```
