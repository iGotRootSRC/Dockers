#!/usr/bin/env sh
# Find NSE scripts for vulnerability scanning.

[ -z $1 ] && echo "Usage: sh $0 <service>" && exit
type=${1}

s_local=`find /usr -name '*.nse' -type f 2>/dev/null | grep -oE '.*/nmap/scripts/' | sort -u`
search='VULNERABLE|vulns\.STATE\.VULN|CVE-[0-9]{1,}-[0-9]{1,}|cve-[0-9]{1,}-[0-9]{1,}'
scripts=$(
    for nse in `ls -1 ${s_local}/*.nse | grep -E "/${type}"`
    do
       [ -n "`grep -m1 -oE  ${search} ${nse}`" ] && \
       n=`echo ${nse} | sed 's/.nse//g' | grep -oE "/${type}.*" | tr -d '/'` && echo "'${n}',"
    done
)
echo "${scripts%?}"
