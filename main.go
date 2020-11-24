package main

import (
	"net/http"

	"github.com/goproxy/goproxy"
)

func main() {
	http.ListenAndServe("0.0.0.0:8899", goproxy.New())
}
