#apache2ctl -D FOREGROUND > /dev/null 2>&1 &
nginx -c /etc/nginx/nginx.conf  -g "daemon off;" > /dev/null 2>&1 &
/bin/prox -config /etc/config.json >/dev/null 2>&1
