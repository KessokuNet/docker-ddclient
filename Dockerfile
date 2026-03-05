FROM lscr.io/linuxserver/ddclient:latest

LABEL maintainer="Cappy Ishihara <cappy@cappuchino.xyz>"
LABEL org.opencontainers.image.source="https://github.com/KessokuNet/docker-ddclient" 

ENV SLEEP_TIME=300

# ENV DEBIAN_FRONTEND=noninteractive
# RUN apt-get update  \
#      && apt-get install -y --no-install-recommends ddclient libio-socket-ssl-perl libjson-any-perl ca-certificates  \
#      && rm -rf /var/lib/apt/lists/*

ADD entrypoint.sh /entrypoint.sh
ENTRYPOINT [ "/entrypoint.sh" ]
