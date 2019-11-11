# DOCKER REDIS

Visit the [Redis Docker Hub page](https://hub.docker.com/_/redis) for more information and additional images.

## How to use this image

### start a redis instance with external persistence of data

```bash
co=18500
if ! docker ps -a --format "{{.Ports}}"| grep -oP "\:$co\-"; then
    [[ ! -d "/data/db/redis/$co" ]] && mkdir -p "/data/db/redis/$co"
    chmod -R 0777 "/data/db/redis/$co"
    docker run -ti \
      --restart unless-stopped \
      --cpus 2 --memory 2048m \
      --memory-swap 2048m \
      --storage-opt size=1G \
      -p $co:6379 \
      -v /data/db/redis/$co:/data \
      -v /data/transfer:/transfer \
      -e 'REDIS_PASSWORD="d3m0.Pa55w0rd.01"' \
      --name redis-$co \
      -d redis:5.0
    echo "Done."
fi
unset co
docker ps --filter "name=redis"
```

### connect to it from an application

```bash
$ docker run --name some-app --link some-redis:redis -d some-app-image:5.0
```

# BUILD

## How to build this image

```bash
# Source Directory
mkdir -p /data/src

# Get Source
git clone -b master --single-branch https://github.com/alejandrobernardis/docker-redis.git /data/src/docker-redis

# Source Directory
cd /data/src/docker-redis/5.0

# Local Storage
docker build -t redis:5.0 -f Dockerfile .
```
