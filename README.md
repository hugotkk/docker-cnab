
Bundle common tools in work...

# Packages included

* helm
* eksctl
* docker-cli
* kubectl
* aws
* ansible
* terraform
* vim
* git
* curl
* bash
* ssh

# Known issue

on arm64, do not why sometime terraform does not work

```
qemu: uncaught target signal 11 (Segmentation fault) - core dumped
Segmentation fault
```

# Build manually

```
BUILDKIT=1 docker build . -t hugotse/cnab:latest
```

# Build with buildx

```
BUILDKIT=1 docker buildx build --platform=linux/amd64,linux/arm64 . -t hugotse/cnab:latest
```

# Use cases

## one time container

```
docker run -it \
-v ~/workplace:/app \
-v ~/.ssh:/root/.ssh \
-v ~/.aws:/root/.aws \
-v ~/.kube:/root/.kube \
hugotse/cnab bash
```

## long running daemon

```
docker run -d \
-v ~/workplace:/app \
-v ~/.aws:/root/.aws \
-v ~/.ssh:/root/.ssh \
-v ~/.kube:/root/.kube \
hugotse/cnab
```

```
docker exec -it <container_id> bash
```

## exec inline commands

```
docker run -it \
-v ~/.aws:/root/.aws \
hugotse/cnab aws
```
