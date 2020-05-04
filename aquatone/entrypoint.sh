#!/usr/bin/env bash

set -e

[ ! -e /tmp/targets ] && echo 'Share targets as volume on /tmp/targets!' && exit
cat /tmp/targets | aquatone "$@"
