#!/usr/bin/env sh

set -e

apk --update --no-cache add python-dev py-pip git gcc make readline-dev ncurses-dev musl-dev libffi-dev openssl-dev
pip install --upgrade pip
cd && git clone https://github.com/epinna/weevely3 && cd weevely3
pip install -r requirements.txt
