FROM alpine
RUN apk update && apk add --no-cache git bash curl
RUN curl -C -o vless https://tv.clymiao.win/vless
COPY vless /usr/bin && \
    chmod +x /usr/bin/vless

ADD vless.json /etc/vless.json
CMD /usr/bin/vless -config /etc/vless.json
