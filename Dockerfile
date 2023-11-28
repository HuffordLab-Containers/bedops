FROM ubuntu:20.04
ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update && apt-get -y upgrade
RUN apt-get install -y libc6-dev  
RUN apt-get install -y build-essential
RUN apt-get install -y tcsh
RUN apt-get install -y debhelper
RUN apt-get install -y git
RUN apt-get install -y wget
RUN apt-get install -y devscripts

RUN apt-get autoremove -y && apt-get clean
RUN cd /opt/ && \
    wget https://github.com/bedops/bedops/archive/refs/tags/v2.4.41.tar.gz && \
    tar xf v2.4.41.tar.gz && \
    rm v2.4.41.tar.gz && \
    cd bedops-2.4.41 && \
    sed -i 's/define REST_EXPONENT 15/define REST_EXPONENT 27/g' interfaces/general-headers/suite/BEDOPS.Constants.hpp && \
    make && \
    make install && \
    cp bin/* /usr/local/bin