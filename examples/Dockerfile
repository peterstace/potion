FROM debian:10.4

RUN apt-get -y update && apt-get -y install \
        git \
        build-essential \
        automake \
        libtool \
        rsync \
        libsqlite3-dev \
        && rm -rf /var/lib/apt/lists/*

RUN git clone https://github.com/perl11/potion.git

WORKDIR potion
RUN make

ENTRYPOINT [ "bin/potion" ]
