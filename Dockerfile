FROM golang:alpine AS vlesser

RUN apk update && apk add --no-cache git bash wget curl
WORKDIR /build
RUN echo $(uname -a)
