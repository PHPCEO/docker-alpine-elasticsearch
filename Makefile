build:
	    docker build -t alpine-elasticsearch --rm=true .

debug:
	    docker run -i -t --entrypoint=sh alpine-elasticsearch

run:
	    docker run -i -P alpine-elasticsearch
