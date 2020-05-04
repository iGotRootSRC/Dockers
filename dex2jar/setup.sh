#!/usr/bin/env sh

set -e

apk --update --no-cache add openjdk8 curl
project='https://api.github.com/repos/pxb1988/dex2jar/releases/latest'
url=`curl -sSL $project | grep browser_download_url | grep -oE 'https://.*.zip'`
cd && curl -sSL -O $url
unzip *.zip && rm *.zip && mv dex2jar* dex2jar && chmod +x dex2jar/*.sh
apk del curl
