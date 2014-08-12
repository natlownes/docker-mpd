#!/usr/bin/env bash

mkdir -p /opt/music/.mpd
mkdir -p /opt/music/.mpd/playlists
chown -R mpd /opt/music/.mpd

mpd --no-daemon --stdout -v /etc/mpd.conf
