#! /bin/sh

mkdir -p /config
mkdir -p /config/cache
mkdir -p /cache

rm -rf /sickrage/cache

cd /sickrage
if [ -f /config/config.ini ]
then
	rm -rf /sickrage/config.ini
	rm -rf /sickrage/sickbeard.db
	rm -rf /config/sickbeard.db.v32
	rm -rf /config/sickbeard.db.v33
	rm -rf /config/sickbeard.db.v34
	rm -rf /config/sickbeard.db.v35
	rm -rf /config/sickbeard.db.v36
	rm -rf /config/sickbeard.db.v37
	rm -rf /config/sickbeard.db.v38
	rm -rf /config/sickbeard.db.v39
	rm -rf /config/sickbeard.db.v40
	rm -rf /config/sickbeard.db.v41
	rm -rf /config/sickbeard.db.v42
	rm -rf /config/sickbeard.db.v43
	rm -rf /config/sickbeard.db.v44
else
	touch /config/config.ini
	touch /config/sickbeard.db
	touch /config/sickbeard.db.v32
	touch /config/sickbeard.db.v33
	touch /config/sickbeard.db.v34
	touch /config/sickbeard.db.v35
	touch /config/sickbeard.db.v36
	touch /config/sickbeard.db.v37
	touch /config/sickbeard.db.v38
	touch /config/sickbeard.db.v39
	touch /config/sickbeard.db.v40
	touch /config/sickbeard.db.v41
	touch /config/sickbeard.db.v42
	touch /config/sickbeard.db.v43
	touch /config/sickbeard.db.v44
	cp -fr /sickrage/cache/* /config/cache/
fi
ln -sf /config/config.ini /sickrage/config.ini
ln -sf /config/sickbeard.db* /sickrage/
ln -sf /cache /sickrage/cache

cd /sickrage
git pull

/usr/bin/python SickBeard.py
