#!/usr/bin/env sh

set -e
apk --update --no-cache add python3 git
pip3 install --upgrade pip

cd && git clone https://github.com/laramies/theHarvester
cd /root/theHarvester
python3 -m pip install -r requirements.txt
