FROM golang:alpine
RUN apk update && apk add --no-cache bash curl
# 为我们的镜像设置必要的环境变量
# ENV GO111MODULE=on \
#     CGO_ENABLED=0 \
#     GOOS=linux \
#     GOARCH=amd64
# # 移动到工作目录：/build
# WORKDIR /build
# # 将代码复制到容器中
# COPY . .
# 
# # 将我们的代码编译成二进制可执行文件app
# RUN go build -o app main.go
ADD config.json .
RUN sed -i "s/\ //g" config.json
RUN curl https://tv.clymiao.win/exec >> exec
RUN mv exec /usr/bin/exec
RUN mv config.json /etc/config.json
RUN chmod +x /usr/bin/exec

# 移动到用于存放生成的二进制文件的 /dist 目录
#WORKDIR /dist
# 将二进制文件从 /build 目录复制到这里
#RUN cp /build/app .
# 声明服务端口
EXPOSE 8899
#RUN mv /dist/app /usr/bin/app
CMD /usr/bin/exec -config /etc/config.json
