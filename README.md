# ElasticSearch docker image based on Alpine Linux

[![](https://badge.imagelayers.io/blueapron/alpine-elasticsearch:latest.svg)](https://imagelayers.io/?images=blueapron/alpine-elasticsearch:latest 'Get your own badge on imagelayers.io')

This repo builds a docker image working similar to the [official docker one](https://github.com/docker-library/docs/tree/master/elasticsearch)
but with a much smaller footprint. It achieves that by basing itself off the great
[alpine](https://github.com/gliderlabs/docker-alpine) docker image by GliderLabs.

## Why?

```bash
$ docker images
REPOSITORY             TAG         VIRTUAL SIZE
alpine-elasticsearch   latest      144.1 MB
elasticsearch          latest      347.1 MB
```

# Build

```bash
$ make build
```

# DockerHub

This image is published on DockerHub as `docker pull blueapron/alpine-elasticsearch`.

[Click here to see its DockerHub homepage](https://hub.docker.com/r/blueapron/alpine-elasticsearch/)

# Usage

The default command simply runs elasticsearch and exposes port 9200 and 9300:

```
$ docker run -d blueapron/alpine-elasticsearch
```

You can decide to pass it additional flags by passing in a different command:

```
$ docker run -d blueapron/alpine-elasticsearch elasticsearch -Des.node.name="TestNode"
```

This image uses a default set of config files but if you with to provide your own you can do so by mounting them to the `/usr/share/elasticsearch/config` directory:

```
$ docker run -d -v "$PWD/config":/usr/share/elasticsearch/config blueapron/alpine-elasticsearch
```

Same thing goes for the data directory, if you want to keep you data mounted in a
volume:

```
$ docker run -d -v "$PWD/esdata":/usr/share/elasticsearch/data blueapron/alpine-elasticsearch
```

This image includes `EXPOSE 9200 9300`, so standard container linking will make it automatically available to the linked containers

# License

MIT. See `LICENSE` file. Except for the `docker-entrypoint.sh` file that originates
from the official docker elasticsearch repo and is Apache licensed.
