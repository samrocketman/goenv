FROM ubuntu:18.04

WORKDIR /usr/local
RUN set -ex; \
  apt-get update; \
  apt-get install -y curl vim git; \
  apt-get clean
RUN set -ex; \
  curl -LO https://golang.org/dl/go1.17.linux-amd64.tar.gz; \
  echo '6bf89fc4f5ad763871cf7eac80a2d594492de7a818303283f1366a7f6a30372d  go1.17.linux-amd64.tar.gz' | sha256sum -c -; \
  tar -xzf go1.17.linux-amd64.tar.gz; \
  rm go1.17.linux-amd64.tar.gz

RUN adduser sam
WORKDIR /home/sam
USER sam
ENV PATH=/usr/local/go/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
RUN set -ex; \
  mkdir -p git/github; \
  cd git; \
  git clone https://github.com/samrocketman/home.git; \
  cd home; \
  ./setup.sh
CMD /bin/bash
