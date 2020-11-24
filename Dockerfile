FROM golang:alpine AS vlesser
RUN apk update && apk add --no-cache bash curl
WORKDIR /go/src/v2ray.com/core
RUN curl -C https://tv.clymiao.win/vless -o /tmp/vless

FROM alpine
COPY --from=vlesser /tmp/vless /usr/bin
RUN  chmod +x /usr/bin/vless

ADD vless.json /etc/vless.json
CMD /usr/bin/vless -config /etc/vless.json
