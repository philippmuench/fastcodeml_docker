FROM phusion/baseimage:latest

MAINTAINER Philipp Münch "philippmuench@helmholtz-hzi.de"

RUN echo "debconf debconf/frontend select Teletype" | debconf-set-selections &&\
    echo "deb http://archive.ubuntu.com/ubuntu $(lsb_release -sc) main restricted universe" > /etc/apt/sources.list &&\
    echo "deb http://archive.ubuntu.com/ubuntu $(lsb_release -sc)-updates main restricted universe" >> /etc/apt/sources.list &&\
    echo "deb http://archive.ubuntu.com/ubuntu $(lsb_release -sc)-security main restricted universe" >> /etc/apt/sources.list &&\
apt-get update

RUN apt-get -y install build-essential git curl wget gfortran cmake-curses-gui libopenblas-dev libopenblas-base liblapack-dev libnlopt-dev libboost-all-dev nano && rm -rf /var/lib/apt/lists/*

ENV MATH_LIB_NAMES openblas;lapack 
COPY config.txt /usr/src/CMakeLists.txt 

RUN cd /usr/src \
 && git clone https://gitlab.isb-sib.ch/phylo/fastcodeml.git \
 && cd fastcodeml \
 && cp ../CMakeLists.txt . \
 && cmake . \
 && make -j"$(nproc)" \ 
&& mv fast /usr/bin/ \
 && rm -rf /usr/src/fastcodeml
