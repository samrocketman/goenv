FROM ubuntu:20.04

SHELL ["/bin/sh", "-exc"]
WORKDIR /usr/local
RUN \
  apt-get update; \
  apt-get install -y curl vim git make; \
  apt-get clean

COPY download-utilities.yml /usr/local/
RUN \
  curl -sSfLo /usr/local/bin/download-utilities.sh \
    https://raw.githubusercontent.com/samrocketman/yml-install-files/v2.5/download-utilities.sh; \
  chmod 755 /usr/local/bin/download-utilities.sh; \
  download-utilities.sh
#RUN \
#  curl -sSfLO https://go.dev/dl/go1.20.4.linux-amd64.tar.gz; \
#  echo '698ef3243972a51ddb4028e4a1ac63dc6d60821bf18e59a807e051fee0a385bd  go1.20.4.linux-amd64.tar.gz' | sha256sum -c -; \
#  tar -xzf go1.20.4.linux-amd64.tar.gz; \
#  rm go1.20.4.linux-amd64.tar.gz

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
