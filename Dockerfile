FROM debian:jessie-slim

RUN apt-get update && \
    apt-get install -yq \ 
      camlp4 \
      gawk \
      git \
      gcc \
      libcairo-dev \
      libgtk2.0-dev \
      make \
      perl && \
    apt-get clean

RUN cd /tmp && \
    git clone https://github.com/facebook/pfff.git --depth=1 && \
    cd pfff && \
    ./configure --prefix=/usr && \
    make depend && \
    make && \
    make opt && \
    make install && \
    cd .. && \
    rm -rf pfff

WORKDIR /workdir
