
# Build
```
BUILDKIT=1 docker build . -t hugotse/cnab:latest
```

# Run

```
docker run -it \
-v ~/workplace:/app \
hugotse/cnab
```

```
docker run -it \
-v ~/.aws:/root/.aws \
-v ~/.kube:/root/.kube \
hugotse/cnab
```
