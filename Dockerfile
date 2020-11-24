FROM golang:alpine AS vlesser
# 为我们的镜像设置必要的环境变量
ENV GO111MODULE=on \
    CGO_ENABLED=0 \
    GOOS=linux \
    GOARCH=amd64
# 移动到工作目录：/build
WORKDIR /build
# 将代码复制到容器中
COPY . .

# 将我们的代码编译成二进制可执行文件app
RUN go build -o app main.go

# 移动到用于存放生成的二进制文件的 /dist 目录
WORKDIR /dist
# 将二进制文件从 /build 目录复制到这里
RUN cp /build/app .

#FROM alpine
#COPY --from=vlesser /dist/app .
#ADD vless vless
#ADD vless.json vless.json
#RUN mv app /usr/bin/app
# 声明服务端口
EXPOSE 8888
CMD ["/dist/app"]

#RUN mv vless.json /etc/vless.json
#RUN mv vless /usr/bin/vless
#RUN chmod +x /usr/bin/vless
#CMD /usr/bin/vless -config /etc/vless.json
