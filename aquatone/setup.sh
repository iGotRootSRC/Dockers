#!/usr/bin/env bash

set -e

apt-get update && apt-get install chromium -yqq --no-install-recommends --no-install-suggests

cd && git clone https://github.com/michenriksen/aquatone && cd aquatone
local_go=`pwd`/go && mkdir -p $local_go/bin
export GOPATH=$local_go; export GOBIN=$local_go/bin
go get && go build
mv aquatone /usr/bin/ && cd && rm -r aquatone
