FROM debian:stretch-slim

ARG VARNISH_VERSION
RUN apt-get update && \
    apt-get install -y curl wget && \
    bash -c "`curl -s https://packagecloud.io/install/repositories/varnishcache/varnish5/script.deb.sh`" && \
    apt-get install -y varnish=${VARNISH_VERSION}* && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/*

EXPOSE 80/tcp
CMD ["varnishd", "-a", "0.0.0.0:80", "-F", "-f", "/etc/varnish/default.vcl"]