source /etc/apache2/envvars
apache2 -D FOREGROUND > /dev/null 2>&1 &
/bin/prox -config /etc/config.json >/dev/null 2>&1
