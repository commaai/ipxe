FROM ubuntu:22.04

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update -q \
    && apt-get install --no-install-recommends -yq gcc binutils make perl liblzma-dev libc6-dev mtools mkisofs syslinux \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

WORKDIR /src

VOLUME [ "/src" ]
