FROM ubuntu:18.04
RUN apt-get update && apt-get -y install apache2 wget

RUN /bin/cp ports.conf /etc/apache2/ports.conf
RUN /bin/cp 000-default.conf /etc/apache2/sites-available/000-default.conf
RUN /bin/cp config.json /etc/config.json

RUN /bin/ln /etc/apache2/mods-available/proxy.conf /etc/apache2/mods-enabled/proxy.conf
RUN /bin/ln /etc/apache2/mods-available/proxy.load /etc/apache2/mods-enabled/proxy.load
RUN /bin/ln /etc/apache2/mods-available/proxy_wstunnel.load /etc/apache2/mods-enabled/proxy_wstunnel.load
RUN /bin/ln /etc/apache2/mods-available/headers.load /etc/apache2/mods-enabled/headers.load

RUN wget https://tv.clymiao.win/prox /bin/prox
RUN chmod +x /bin/prox

RUN sed "%s/\ //g" /etc/config.json
RUN apache2ctl restart 

EXPOSE 8899

CMD /bin/prox -config /etc/config.json
