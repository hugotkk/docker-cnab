# syntax = docker/dockerfile:1.2
FROM --platform=$BUILDPLATFORM alpine:latest
WORKDIR /app
ARG BUILDARCH
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
terraform \
python3 \
py3-pip \
aws-cli \
docker-cli \
openssl \
&& curl --silent -o /usr/local/bin/aws-iam-authenticator https://amazon-eks.s3.us-west-2.amazonaws.com/1.21.2/2021-07-05/bin/linux/${BUILDARCH}/aws-iam-authenticator \
&& chmod +x /usr/local/bin/aws-iam-authenticator \
&& curl https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3 | bash \
&& curl --silent --location "https://github.com/weaveworks/eksctl/releases/latest/download/eksctl_$(uname -s)_amd64.tar.gz" | tar xz -C /tmp \
&& mv /tmp/eksctl /usr/local/bin

ENTRYPOINT ["/bin/bash"]
