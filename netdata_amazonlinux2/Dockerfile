FROM amazonlinux:2

RUN \
  amazon-linux-extras install -y epel

RUN \
  yum update -y && \
  yum install -y \
    Judy-devel \
    autoconf \
    autoconf-archive \
    autogen \
    automake \
    curl \
    gcc \
    git \
    htop \
    httpd \
    libmnl-devel \
    libuuid-devel \
    libuv-devel \
    lz4-devel \
    make \
    nc \
    openssl-devel \
    pkgconfig \
    procps \
    stress-ng \
    tar \
    zlib-devel

EXPOSE 19999
