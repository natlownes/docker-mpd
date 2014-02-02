FROM ubuntu:raring
MAINTAINER Nat Lownes <nat.lownes@gmail.com>

# must run in privileged mode (-privileged)

RUN apt-get -qq update
RUN locale-gen en_US en_US.UTF-8
RUN dpkg-reconfigure locales 

RUN apt-get install -y bash mpd nfs-common nfs-client

ADD mpd.conf /etc/mpd.conf
ADD start.sh /home/mpd/start.sh

RUN chmod +x /home/mpd/start.sh

# change for your setup or override using -e
ENV NFS_MOUNT nas:/mnt/biggins/music

EXPOSE 6600 8000

ENTRYPOINT /home/mpd/start.sh
