#!/bin/bash

env

# example nas:/mnt/biggins/music
nfs_mount=${NFS_MOUNT}
mountpoint="/var/lib/mpd/music"

if [ ! $nfs_mount ]; then
  echo "***************************************"
  echo "must set NFS_MOUNT environment variable"
  echo "***************************************"
  exit 1
fi

rpcbind &&
rpc.statd &&

#mount -t nfs -o timeo=600 -o tcp -o hard -o bg $nfs_mount $mountpoint -vvvv &&
mount -t nfs $nfs_mount $mountpoint -vvv &&

mpd --no-daemon --stdout -v /etc/mpd.conf
