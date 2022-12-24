#!/bin/bash
# ANSI Escape Code
NC='\e[0m'
## Foreground
DEFBOLD='\e[39;1m'
RB='\e[31;1m'
GB='\e[32;1m'
YB='\e[33;1m'
BB='\e[34;1m'
MB='\e[35;1m'
CB='\e[35;1m'
WB='\e[37;1m'

# Source ANSI
# https://ansi.gabebanks.net/
clear
echo -e "${YB}[INFO ] Start${NC} " 
sleep 0.5
systemctl stop nginx
domain=$(cat /var/lib/dnsvps.conf | cut -d'=' -f2)
Cek=$(lsof -i:80 | cut -d' ' -f1 | awk 'NR==2 {print $1}')
if [[ ! -z "$Cek" ]]; then
sleep 1
echo -e "${YB}[WARNING ] Detected port 80 used by $Cek${NC} " 
systemctl stop $Cek
sleep 2
echo -e "${YB}[INFO ] Processing to stop $Cek${NC} " 
sleep 1
fi
echo -e "${YB}[INFO ] Starting renew cert...${NC} " 
sleep 2
cd .acme.sh
bash acme.sh --issue -d $domain --server letsencrypt --keylength ec-256 --fullchain-file /usr/local/etc/xray/xray.crt --key-file /usr/local/etc/xray/xray.key --standalone --force
echo -e "${YB}[INFO ] Renew cert done...${NC} " 
sleep 2
echo -e "${YB}[INFO ] Starting service $Cek${NC} " 
sleep 2
echo "$domain" > /usr/local/etc/xray/domain
systemctl restart $Cek
systemctl restart nginx
echo -e "${YB}[INFO ] All finished...${NC} " 
sleep 0.5
echo ""
read -n 1 -s -r -p "Press any key to back on menu"
menu
