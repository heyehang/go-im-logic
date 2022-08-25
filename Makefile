#!/usr/bin/env bash

all: fmt build

fmt:
	goimports -l -w  ./

build: fmt
	go build -ldflags "-s -w" -o build/go_im_logic cmd/main.go
clean:
	rm -rf build/
gotest:
	 go test ./... | grep -v "^ok "
run:
	 build/go_im_logic
