# ElasticSearch docker image based on Alpine Linux

This repo builds a docker image working similar to the [official docker one](https://github.com/docker-library/docs/tree/master/elasticsearch)
but with a much smaller footprint. It achieves that by basing itself off the great
[alpine](https://github.com/gliderlabs/docker-alpine) docker image by GliderLabs.

## Why?

```bash
$ docker images
REPOSITORY             TAG         VIRTUAL SIZE
alpine-elasticsearch   latest      22.28 MB
elasticsearch          latest      213.90 MB
```

# Build

```bash
$ make build
```

# DockerHub

This image is published on DockerHub as `docker pull kiasaki/alpine-elasticsearch`.

[Click here to see it's DockerHub homepage](https://hub.docker.com/r/kiasaki/alpine-elasticsearch/)


# License

MIT. See `LICENSE` file. Except for the `docker-entrypoint.sh` file that originates
from the official docker elasticsearch repo and is Apache licensed.
