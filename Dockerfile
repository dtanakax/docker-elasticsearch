# Set the base image
FROM tanaka0323/java8

# File Author / Maintainer
MAINTAINER Daisuke Tanaka, tanaka@infocorpus.com

ENV DEBIAN_FRONTEND noninteractive
ENV ES_VERSION 1.5.0

RUN apt-get update && \
    apt-get install -y curl && \
    rm -rf /var/lib/apt/lists/*
RUN apt-get clean all

RUN curl -k https://download.elasticsearch.org/elasticsearch/elasticsearch/elasticsearch-$ES_VERSION.tar.gz >> es.tar.gz && \
    tar zxvf es.tar.gz && \
    mv -f /elasticsearch-$ES_VERSION /opt/elasticsearch && \
    rm -f es.tar.gz

# Adding the configuration file
COPY elasticsearch.yml /opt/elasticsearch/config/elasticsearch.yml
COPY start.sh /start.sh
RUN chmod +x /start.sh

# Define mountable directories.
VOLUME ["/data"]

# Expose ports.
#   - 9200: HTTP
#   - 9300: transport
EXPOSE 9200 9300

# Executing sh
ENTRYPOINT ./start.sh