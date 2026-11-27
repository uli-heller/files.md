#!/bin/sh

VERSION="$(git describe --tags)"
go build -o "files-md-server" ./cmd/server
tar -cf - ./files-md-server ./web|xz -c9 >"files-md-${VERSION}.tar.xz"
