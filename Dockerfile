FROM ubuntu:18.04
USER root

WORKDIR /bitfusion-client

# Install required libraries
RUN apt-get update && apt-get install -y --no-install-recommends \
    libcurl4-openssl-dev \
    wget \
    zlib1g-dev \
    git \
    pkg-config \
    python3 \
    python3-pip\
    vim \
    open-vm-tools

COPY bitfusion-client-ubuntu1804_2.0.0beta5-11_amd64.deb .
COPY json-c /bitfusion-client/json-c
RUN apt install cmake -y && \
mkdir json-c-build && \
cd json-c-build && \
cmake /bitfusion-client/json-c && \
make && \
make test && \
make install &&\
echo "include /usr/local/lib/" >> /etc/ld.so.conf &&\
sed -i '2d' /etc/ld.so.conf &&\
apt install vim -y

RUN dpkg -i bitfusion-client-ubuntu1804_2.0.0beta5-11_amd64.deb; exit 0
RUN apt --fix-broken install -y
RUN apt -f install
COPY bitfusion /etc/bitfusion
COPY .bitfusion /root/.bitfusion


RUN cd /usr/local/bin &&\
   ln -s /usr/bin/python3 python
