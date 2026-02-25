FROM ubuntu:24.04

SHELL ["/bin/sh", "-exc"]
WORKDIR /usr/local
RUN \
  apt-get update; \
  apt-get install -y curl vim git make xz-utils; \
  apt-get clean

COPY go.yml /usr/local/
ENV YQ_OPTIONS=--yaml-fix-merge-anchor-to-spec
RUN \
  curl -sSfL \
    https://github.com/samrocketman/yml-install-files/releases/download/v3.8/universal.tgz | \
    tar -xzC /usr/local/bin/ --no-same-owner download-utilities.sh; \
  echo '61daa8e38f68f45c1bb8b7eaecd383e6afa6172f2543af24352358e2f1ffeea2  /usr/local/bin/download-utilities.sh' | \
    sha256sum -c -; \
  download-utilities.sh go.yml

#RUN \
#  curl -sSfLO https://go.dev/dl/go1.20.4.linux-amd64.tar.gz; \
#  echo '698ef3243972a51ddb4028e4a1ac63dc6d60821bf18e59a807e051fee0a385bd  go1.20.4.linux-amd64.tar.gz' | sha256sum -c -; \
#  tar -xzf go1.20.4.linux-amd64.tar.gz; \
#  rm go1.20.4.linux-amd64.tar.gz

RUN \
  userdel ubuntu; \
  adduser sam
WORKDIR /home/sam
USER sam
ENV PATH=/usr/local/go/bin:/usr/local/tinygo/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin USER=sam HOME=/home/sam
RUN \
  mkdir -p git/github; \
  cd git; \
  git clone https://github.com/samrocketman/home.git; \
  cd home; \
  ./setup.sh
ENTRYPOINT ["/usr/local/bin/dumb-init", "--"]
CMD /bin/bash
