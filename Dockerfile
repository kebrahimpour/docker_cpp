FROM ubuntu:22.04

LABEL Description="Cpp Build Environment"

USER root

RUN apt-get update && apt-get upgrade -y --no-install-recommends install \
    apt-transport-https \ 
    build-essential \
    cmake \
    wget


RUN cd ${HOME}     && \
    wget --no-check-certificate --quiet \
    https://boostorg.jfrog.io/artifactory/main/release/1.77.0/source/boost_1_77_0.tar.gz &&\
    tar xzf ./boost_1_77_0.tar.gz && \
    cd ./boost_1_77_0 && \
    ./bootstrap.sh && \
    ./b2 install && \
    cd .. && \
    rm -rf ./boost_1_77_0
