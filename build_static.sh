#!/bin/bash

docker run -i -v "$(pwd)":/postfix-metrics-exporter golang:1.20.2 /bin/sh << 'EOF'
set -ex

# Install prerequisites for the build process.
apt-get update -q
apt-get install -yq libsystemd-dev

cd /postfix-metrics-exporter

go get -d ./...
go build -a -tags static_all
strip postfix-metrics-exporter
EOF
