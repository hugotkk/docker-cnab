
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

## mount with workplace then run ansible script, manage k8s cluster, terraform apply etc...

```
docker run -it \
-v ~/workplace:/app \
hugotse/cnab
```

## mount with .aws to use aws cli

```
docker run -it \
-v ~/.aws:/root/.aws \
-v ~/.kube:/root/.kube \
hugotse/cnab
```
