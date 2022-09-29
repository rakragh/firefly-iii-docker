# firefly-iii-docker
Firefly III Docker

docker build -t firefly -f Dockerfile .

OR

docker buildx build --no-cache --platform linux/amd64,linux/arm64,linux/arm/v7,linux/386 --tag rakra/firefly-iii --push .