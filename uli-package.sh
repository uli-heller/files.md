#!/bin/sh

#set -x
VERSION="$(git describe --tags)"
OS="$(uname|tr A-Z a-z)"
ARCH="$(uname -m)"
go build -o "bin/files-md-server" ./cmd/server
tar -cf - ./bin ./web|xz -c9 >"files-md-${VERSION}-${OS}-${ARCH}.tar.xz"
