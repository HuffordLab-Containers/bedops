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
    git clone https://github.com/bedops/bedops.git && \
    cd bedops && \
    make all && \
    make install_all && \
    cp bin/* /usr/local/bin