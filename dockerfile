#
# Dockerfile for hellminer-verus, https://github.com/hellcatz/luckpool
# see run.sh
#

FROM debian:buster-slim
LABEL MAINTAINER="0x03 <0x03-ctrlc@protonmail.com>"

RUN apt-get update && apt-get -y install wget && \
    cd /opt && wget https://github.com/hellcatz/luckpool/raw/master/miners/hellminer_cpu_linux.tar.gz && \
	tar xf hellminer_cpu_linux.tar.gz && rm -rf /opt/hellminer_cpu_linux.tar.gz && \
	apt-get -y purge wget && apt-get -y autoremove --purge && apt-get -y clean && apt-get -y autoclean; rm -rf /var/lib/apt-get/lists/*

USER nobody:nogroup
# it needs a workdir spec in order to see the 'verus-solver' binary right next to it
WORKDIR "/opt"
ENTRYPOINT ["/opt/hellminer"]

# EOF
