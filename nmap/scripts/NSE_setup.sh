#!/usr/bin/env sh
# Tuning scripts for nmap.

nselib=`find /usr -name 'nselib' -type d 2>/dev/null`
scripts=`find /usr -name '*.nse' -type f 2>/dev/null | grep -oE '.*/nmap/scripts' | sort -u`

# 1. find default web credentials
url='https://raw.githubusercontent.com/nnposter/nndefaccts/master/http-default-accounts-fingerprints-nndefaccts.lua'
curl -sSL $url > $nselib/data/http-default-accounts-fingerprints.lua


# 2. vulners database (https://vulners.com)
url='https://raw.githubusercontent.com/vulnersCom/nmap-vulners/master/vulners.nse'
curl -sSL $url > $scripts/vulners.nse


# 3. banner-plus script
url='https://raw.githubusercontent.com/hdm/scan-tools/master/nse/banner-plus.nse'
curl -sSL $url > $scripts/banner-plus.nse


# 4. vulscan
[ -e $scripts/vulscan ] && rm -r $scripts/vulscan
git clone https://github.com/scipag/vulscan "$scripts/vulscan"
url='https://raw.githubusercontent.com/offensive-security/exploitdb/master/files_exploits.csv'
curl $url -sSL  | awk -F ',' '{print $1";"$3}' | tr -d '"' > $scripts/vulscan/exploitdb.csv
