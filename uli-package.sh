#!/bin/sh

VERSION="$(git describe --tags)"
OS="$(uname|tr A-Z a-z)"
ARCH="$(uname -m)"

(
set -x
go build -o "files-md-server-${VERSION}/bin/files-md-server" ./cmd/server
cp -a web files-md-server-${VERSION}/web
tar -cf - "files-md-server-${VERSION}"|xz -c9 >"files-md-server-${VERSION}-${OS}-${ARCH}.tar.xz"
)
rm -rf "files-md-server-${VERSION}"
