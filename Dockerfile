FROM ubuntu:focal
ENV LIBTPMS_VER 0.9.1
ENV SWTPM_VER 0.7.0
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update \
    && apt-get install -y wget autoconf automake build-essential debhelper dh-autoreconf dh-exec dpkg-dev expect gawk gcc gnutls-bin gnutls-dev iproute2 libfuse-dev libglib2.0-dev libgmp-dev libgnutls28-dev libjson-glib-dev libseccomp-dev libssl-dev libtasn1-6-dev libtasn1-dev libtool make net-tools pkg-config python3-setuptools python3-twisted socat softhsm2 \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
VOLUME /usr/src
ADD docker-entrypoint.sh /usr/local/bin/docker-entrypoint.sh
ENTRYPOINT /usr/local/bin/docker-entrypoint.sh
