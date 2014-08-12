# narf-mpd

Docker image for running [MPD](http://www.musicpd.org/doc/user/) on music
mounted from a host directory.

### Assumptions

* You have music you'd like to serve with mpd available in a directory on your
  Docker host.

### Usage

MPD is configured to look in the `/opt/music` directory on the container for
music to serve.  You must mount your host directory on `/opt/music`

To do so, run like:

`docker run -v /mnt/music:/opt/music -p 6600:6600 -p 8000:8000 -t narf/mpd`

...where `/mnt/music` is wherever you have music available on your host.

Since we've forwarded ports above, you'll be able to connect to MPD's web
interface on your host at port 8000, and connect to MPD on your host at port
6600.

MPD is configured to leave playlist, db, and state files in the `.mpd` directory
on your host directory.  In our example, it would leave files in
`/mnt/music/.mpd`.
