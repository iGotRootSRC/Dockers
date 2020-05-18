#!/usr/bin/env bash

set -e

cd && git clone https://github.com/tomnomnom/assetfinder && cd assetfinder
local_go=`pwd`/go && mkdir -p $local_go/bin
export GOPATH=$local_go; export GOBIN=$local_go/bin
go get && go build
mv assetfinder /usr/bin/ && cd && rm -r assetfinder