#!/bin/bash

set -eu -o pipefail

# distribution-specific
PGSERVICE_FILE=/etc/postgresql-common/pg_service.conf

# simple configuration / built-in database
for i in host user password dbname
do
	envvar=MAIN_SERVICE_${i^^}
	crudini --set $PGSERVICE_FILE main-service $i "${!envvar}"
done

# overrides / further services
for var in VALUES SECRET
do
	envvar=PGSERVICE_$var
	if [[ -v $envvar ]]
	then
		crudini --merge $PGSERVICE_FILE <<<${!envvar}
	fi
done

# until https://github.com/pixelb/crudini/commit/65ace170964aa75f36bfeb18cadd995dcd332622 is available
sed 's/ = /=/' -i $PGSERVICE_FILE

exec /usr/bin/xvfb-run --auto-servernum --server-num=1 /usr/bin/spawn-fcgi -p 5555 -n -d /home/qgis -- /usr/lib/cgi-bin/qgis_mapserv.fcgi
