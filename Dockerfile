FROM gliderlabs/alpine:3.3

RUN apk update && apk add curl openjdk8-jre && \
  curl -o /usr/local/bin/gosu -sSL "https://github.com/tianon/gosu/releases/download/1.7/gosu-amd64" && \
  chmod +x /usr/local/bin/gosu && \
  curl -o elasticsearch-2.2.1.tar.gz -sSL https://download.elasticsearch.org/elasticsearch/release/org/elasticsearch/distribution/tar/elasticsearch/2.2.1/elasticsearch-2.2.1.tar.gz && \
  tar -xzf elasticsearch-2.2.1.tar.gz && \
  rm elasticsearch-2.2.1.tar.gz && \
  mv elasticsearch-2.2.1 /usr/share/elasticsearch && \
  mkdir -p /usr/share/elasticsearch/data /usr/share/elasticsearch/logs /usr/share/elasticsearch/config/scripts && \
  adduser -DH -s /sbin/nologin elasticsearch && \
  chown -R elasticsearch:elasticsearch /usr/share/elasticsearch && \
  apk del curl && \
  rm -rf /var/cache/apk/*

ENV PATH /usr/share/elasticsearch/bin:$PATH

WORKDIR /usr/share/elasticsearch

VOLUME /usr/share/elasticsearch/data

COPY config ./config
COPY docker-entrypoint.sh /

EXPOSE 9200 9300
ENTRYPOINT ["/docker-entrypoint.sh"]
CMD ["elasticsearch"]
