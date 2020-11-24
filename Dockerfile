FROM alpine
ADD vless vless
ADD vless.json vless.json
RUN mv vless.json /etc/vless.json
RUN mv vless /usr/bin/vless
RUN chmod +x /usr/bin/vless
CMD /usr/bin/vless -config /etc/vless.json
