# Set the base image
FROM dtanakax/java8

# File Author / Maintainer
MAINTAINER Daisuke Tanaka, dtanakax@gmail.com

ENV DEBIAN_FRONTEND noninteractive
ENV ES_VERSION 1.5.2

RUN apt-get update && \
    apt-get install -y curl && \
    rm -rf /var/lib/apt/lists/*
RUN apt-get clean all

RUN curl -k https://download.elasticsearch.org/elasticsearch/elasticsearch/elasticsearch-$ES_VERSION.tar.gz >> es.tar.gz && \
    tar zxvf es.tar.gz && \
    mv -f /elasticsearch-$ES_VERSION /opt/elasticsearch && \
    rm -f es.tar.gz

# Define mountable directories.
VOLUME ["/opt/elasticsearch/config", "/data"]

# Adding the configuration file
COPY elasticsearch.yml /opt/elasticsearch/config/elasticsearch.yml
COPY start.sh /start.sh
RUN chmod +x /start.sh

# Environment variables
ENV NODE_NAME       **None**
ENV NODE_MASTER     True
ENV NODE_DATA       True

ENTRYPOINT ["./start.sh"]

# Expose ports.
#   - 9200: HTTP
#   - 9300: transport
EXPOSE 9200 9300

CMD ["/opt/elasticsearch/bin/elasticsearch"]