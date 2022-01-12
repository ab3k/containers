# docker/podman

```
apt install --no-install-recommends podman podman-docker uidmap slirp4netns
```

## debian-elixir

```
cd debian-elixir
podman build -t debian-elixir -f Dockerfile
podman run -it --rm localhost/debian-elixir
```
