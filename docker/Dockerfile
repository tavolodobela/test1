FROM ubuntu:18.04

LABEL description="yaml-cpp builder"

ENV DEBIAN_FRONTEND="noninteractive"
ENV UBUNTU_MIRROR "ftp.uni-stuttgart.de"

RUN sed -i "s/archive.ubuntu.com/${UBUNTU_MIRROR}/g" /etc/apt/sources.list && \
    apt-get update && \
    apt-get install -y g++ cmake ssh git

COPY run.sh /

CMD ["/run.sh"]
