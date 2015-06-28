# docker sickrage

This is a Dockerfile to set up "SickRage" - (https://sickrage.tv/forums/)

Build from docker file
----------------------

```
git clone git@github.com:lpicanco/docker-sickrage.git
cd docker-sickrage
docker build -t sickrage .
```

How to run
----------

```
docker run --name sickrage -v /etc/sickrage/config:/config -v /etc/sickrage/cache:/cache -v /media/shows:/media/shows -v /media/torrent_downloads:/media/downloads -p 8081:8081 -d lpicanco/sickrage
```
