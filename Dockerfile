FROM amazonlinux:1 as ruby_builder

WORKDIR /tmp
ENV RUBY_VER="2.5.3"

RUN yum install -y gcc && \
  curl -O https://cache.ruby-lang.org/pub/ruby/2.5/ruby-${RUBY_VER}.tar.gz && \
  tar -zxvf ruby-${RUBY_VER}.tar.gz && \
  cd ruby-${RUBY_VER} && \
  ./configure --disable-install-doc && \
  make && \
  make install && \
  cd .. && \
  rm -r ruby-${RUBY_VER} ruby-${RUBY_VER}.tar.gz


FROM amazonlinux:1 as node_builder

WORKDIR /tmp
ENV NODE_VER="10.13.0"

RUN yum install -y xz xz-devel && \
  curl -O https://nodejs.org/dist/v10.13.0/node-v${NODE_VER}-linux-x64.tar.xz && \
  tar --strip-components 1 -xvf node-v${NODE_VER}-linux-x64.tar.xz -C /usr/local && \
  rm /usr/local/CHANGELOG.md && \
  rm /usr/local/LICENSE && \
  rm /usr/local/README.md


FROM amazonlinux:1

COPY --from=ruby_builder /usr/local /usr/local
COPY --from=node_builder /usr/local /usr/local

RUN yum update -y && \
  ruby --version && \
  gem --version && \
  node -v

