# natlownes-mpd

a Docker container for running mpd on nfs shares

### USAGE

run as so:

`docker run -privileged -e NFS_MOUNT=nas.phl.looting.biz:/mnt/biggins/music -P=true -t natlownes/mpd`
