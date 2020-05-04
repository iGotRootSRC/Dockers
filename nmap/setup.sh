#!/usr/bin/env sh

set -e
apk --update --no-cache add nmap nmap-scripts nmap-nselibs git curl python3

pip3 install --upgrade pip setuptools
pip install python-nmap
