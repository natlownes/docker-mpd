# natlownes-mpd

a Docker container for running mpd on nfs shares

### USAGE

run as so:

`docker run -privileged -e NFS_MOUNT=nas:/mnt/biggins/music -p 6600:6600 -p 8000:8000 -t natlownes/mpd`
