#!/bin/sh

#set -x
VERSION="$(git describe --tags)"
OS="$(uname|tr A-Z a-z)"
ARCH="$(uname -m)"
go build -o "files-md-server" ./cmd/server
tar -cf - ./files-md-server ./web|xz -c9 >"files-md-${VERSION}-${OS}-${ARCH}.tar.xz"
