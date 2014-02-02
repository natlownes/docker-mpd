#!/bin/bash

# example nas:/mnt/biggins/music
nfs_mount=${NFS_MOUNT}
mountpoint="/var/lib/mpd/music"

if [ ! $nfs_mount ]; then
  echo ""
  echo "***************************************"
  echo "must set NFS_MOUNT environment variable"
  echo "***************************************"
  echo ""

  echo "EXAMPLE:"
  echo "docker run -privileged -e NFS_MOUNT=nas:/mnt/biggins/music -p 6600:6600 -p 8000:8000 -t natlownes/mpd"
  echo ""
  exit 1
fi

rpcbind &&
rpc.statd &&

#mount -t nfs -o timeo=600 -o tcp -o hard -o bg $nfs_mount $mountpoint -vvvv &&
mount -t nfs $nfs_mount $mountpoint -vvv &&

mpd --no-daemon --stdout -v /etc/mpd.conf
