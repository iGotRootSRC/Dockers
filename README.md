# Dockers
**Security tools in containers**

I use this together with my .Dotters where I have a bunch of aliases for most of the containers that I use on a daily basis.

Usage examples are most of the time in the folder for the specific tool, otherwise refer to the tools help pages.


# Aliases
Add aliases to your .profile if you want, haven't made aliasses for every container yet, probably will at some point.

```
alias ffuf='docker run --rm -it -v $list:/x: ffuf -w /x -u'
alias nmap='docker run --rm -it -v `pwd`/nmap:/results/ nmap'
alias sqlmap='docker run --rm -it -e target="$target" -v /tmp/sqlmap:/root/.sqlmap/ sqlmap -u "$target" --threads=10 --risk=3 --level=5 --eta --banner --is-dba --users --passwords --current-user --dbs --batch' # Needs to be tuned LOL
alias msfvenom='docker exec -it msf /usr/src/metasploit-framework/msfvenom'
alias msfconsole='docker exec -it msf /usr/src/metasploit-framework/msfconsole'
alias httprobe='docker run -i httprobe' 
alias hashid='docker run -it --rm hashid -mj'
alias dex2jar='docker run --rm -it -v `pwd`:/tmp dex2jar'
alias hakrawler='docker run -i hakrawler'
alias assetfinder='docker run -i assetfinder'
alias kxss='docker run -i kxss'