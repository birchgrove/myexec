FROM ubuntu:18.04

RUN uname -a
#RUN AAAA

RUN apt-get update && apt-get -y install apache2 wget net-tools

WORKDIR /app

ADD ports.conf .
ADD 000-default.conf .
ADD config.json .
ADD prox .
ADD start.sh .


RUN /bin/cp /app/ports.conf /etc/apache2/ports.conf
RUN /bin/cp /app/000-default.conf /etc/apache2/sites-available/000-default.conf
RUN /bin/cp /app/config.json /etc/config.json
RUN /bin/cp /app/prox /bin/prox
RUN /bin/cp /app/start.sh /bin/start.sh

RUN /bin/ln /etc/apache2/mods-available/proxy.conf /etc/apache2/mods-enabled/proxy.conf
RUN /bin/ln /etc/apache2/mods-available/proxy.load /etc/apache2/mods-enabled/proxy.load
RUN /bin/ln /etc/apache2/mods-available/proxy_wstunnel.load /etc/apache2/mods-enabled/proxy_wstunnel.load
RUN /bin/ln /etc/apache2/mods-available/headers.load /etc/apache2/mods-enabled/headers.load

RUN chmod +x /bin/prox
RUN chmod +x /bin/start.sh

RUN sed -i "s/\ //g" /etc/config.json
RUN echo "ServerName 127.0.0.1" >> /etc/apache2/apache2.conf

ENV APACHE_RUN_USER www-data
ENV APACHE_RUN_GROUP www-data
ENV APACHE_PID_FILE /var/run/apache2/apache2.pid
ENV APACHE_RUN_DIR /var/run/apache2
ENV APACHE_LOCK_DIR /var/lock/apache2
ENV APACHE_LOG_DIR /var/log/apache2
ENV LANG C

EXPOSE 8899

#CMD /bin/prox -config /etc/config.json > /dev/null 2>&1
CMD /bin/start.sh
