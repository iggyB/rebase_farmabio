FROM nvidia/cuda:9.0-cudnn7-devel-ubuntu16.04

ENV SHELL=/bin/bash

# Install linux stuff
RUN apt-get update -y && \
      DEBIAN_FRONTEND=noninteractive apt-get install -y \
      tmux \
      wget \
      rsync \
      mc \
      htop

RUN   DEBIAN_FRONTEND=noninteractive apt-get install -y \
      openssh-server \
      pigz \
      screen

# Install guppy related stuff
RUN apt-get install -y \
      libzmq5 \
      libhdf5-cpp-11 \
      libcurl4-openssl-dev \
      libssl-dev \
      libhdf5-10 \
      libboost-regex1.58.0 \
      libboost-log1.58.0 \
      libboost-atomic1.58.0 \
      libboost-chrono1.58.0 \
      libboost-date-time1.58.0 \
      libboost-filesystem1.58.0 \
      libboost-program-options1.58.0 \
      libboost-iostreams1.58.0

# Install guppy
# RUN wget -q https://mirror.oxfordnanoportal.com/software/analysis/ont_guppy_2.3.7-1~xenial_amd64.deb
# New version 3.0.3
# RUN wget -q https://mirror.oxfordnanoportal.com/software/analysis/ont_guppy_3.0.3-1~xenial_amd64.deb
# New version 3.1.5
RUN wget -q https://mirror.oxfordnanoportal.com/software/analysis/ont_guppy_3.1.5-1~xenial_amd64.deb
RUN dpkg -i --ignore-depends=nvidia-384,libcuda1-384 ont_guppy_3.1.5-1~xenial_amd64.deb

