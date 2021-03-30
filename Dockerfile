FROM nvidia/cuda:9.0-cudnn7-devel-ubuntu16.04

ENV SHELL=/bin/bash

ARG PACKAGE_VERSION=4.5.2
ARG DEBIAN_FRONTEND=noninteractive

# Install linux stuff
RUN apt-get update -y && \
      apt-get install -y \
      tmux \
      wget \
      rsync \
      mc \
      htop \
      nano \
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
      libboost-system1.58.0 \
      libboost-iostreams1.58.0

# Install guppy
RUN wget -q https://mirror.oxfordnanoportal.com/software/analysis/ont_guppy_${PACKAGE_VERSION}-1~xenial_amd64.deb
RUN dpkg -i --ignore-depends=nvidia-384,libcuda1-384 ont_guppy_${PACKAGE_VERSION}-1~xenial_amd64.deb

