# syntax = docker/dockerfile:1.2
FROM alpine:latest
WORKDIR /app
RUN --mount=type=cache,target=/var/cache/apk \
apk add \
-X http://dl-cdn.alpinelinux.org/alpine/edge/testing \
git \
vim \
bash \
curl \
bash \
ansible \
kubectl \
helm \
terraform \
python3 \
py3-pip \
aws-cli \
&& curl --silent --location "https://github.com/weaveworks/eksctl/releases/latest/download/eksctl_$(uname -s)_amd64.tar.gz" | tar xz -C /tmp \
&& mv /tmp/eksctl /usr/local/bin

ENTRYPOINT ["/bin/bash"]