FROM debian:jessie
MAINTAINER Luiz Picanco <lpicanco@gmail.com>

ENV DEBIAN_FRONTEND noninteractive
ENV SICKRAGE_VERSION master
ENV LANG en_US.UTF-8
ENV LC_ALL C.UTF-8
ENV LANGUAGE en_US.UTF-8

RUN sed -i "/^# deb.*multiverse/ s/^# //" /etc/apt/sources.list && \
    echo 'deb http://ftp.us.debian.org/debian jessie main contrib non-free' >>  /etc/apt/sources.list && \
    apt-get -q update && \
    apt-get -qy --force-yes dist-upgrade && \
    apt-get install -qy --force-yes python-cheetah wget tar ca-certificates curl unrar && \
    curl -L https://github.com/SiCKRAGETV/SickRage/tarball/${SICKRAGE_VERSION} -o sickrage.tgz && \
    tar -xvf sickrage.tgz -C /  &&\
    mv /SiCKRAGETV-SickRage-* /sickrage/ &&\
    rm  /sickrage.tgz &&\
    apt-get clean &&\
    rm -rf /var/lib/apt/lists/* &&\
    rm -rf /tmp/*

VOLUME /config
VOLUME /media/data
VOLUME /media/downloads

ADD ./start.sh /start.sh
RUN chmod u+x  /start.sh

EXPOSE 8081

CMD ["/start.sh"]
