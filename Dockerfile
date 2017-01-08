FROM debian:jessie
MAINTAINER Louis Billiet <louis.billiet59@gmail.com>

ENV TRANSMISSION_HOME /transmission/config
EXPOSE 9091/tcp
EXPOSE 51413
RUN mkdir -p /transmission/download \
             /transmission/finished \
             /transmission/config &&  \
    chmod -R 1777 /transmission
VOLUME ['/transmission/download','/transmission/finished','/transmission/incomplete']

RUN apt-get update && \
    apt-get install -y transmission-daemon && \
    rm -rf /var/lib/apt/lists/*

COPY files/copy_finished.sh /transmission/scripts/copy_finished.sh
RUN chmod a+x /transmission/scripts/copy_finished.sh
COPY files/setting.json /transmission/config/settings.json

CMD ["/usr/bin/transmission-daemon", "--download-dir", "/transmission/download", "--config-dir", "/transmission/config", "--foreground", "--allowed", "127.*,10.*,192.168.*,172.16.*,172.17.*,172.18.*,172.19.*,172.20.*,172.21.*,172.22.*,172.23.*,172.24.*,172.25.*,172.26.*,172.27.*,172.28.*,172.29.*,172.30.*,172.31.*,169.254.*", "-f", "--log-error"]
