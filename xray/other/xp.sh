#!/bin/bash

clear
##----- Auto Remove Vmess
data=($(cat /usr/local/etc/xray/config.json | grep '^#@' | cut -d ' ' -f 2 | sort | uniq))
now=$(date +"%Y-%m-%d")
for user in "${data[@]}"; do
exp=$(grep -w "^#@ $user" "/usr/local/etc/xray/config.json" | cut -d ' ' -f 3 | sort | uniq)
d1=$(date -d "$exp" +%s)
d2=$(date -d "$now" +%s)
exp2=$(((d1 - d2) / 86400))
if [[ "$exp2" -le "0" ]]; then
sed -i "/^#@ $user $exp/,/^},{/d" /usr/local/etc/xray/config.json
sed -i "/^#@ $user $exp/,/^},{/d" /usr/local/etc/xray/config.json
rm -rf /var/www/html/vmess/vmess-$user.txt
rm -rf /user/log-vmess-$user.txt
fi
done

##----- Auto Remove Vless
data=($(cat /usr/local/etc/xray/config.json | grep '^#=' | cut -d ' ' -f 2 | sort | uniq))
now=$(date +"%Y-%m-%d")
for user in "${data[@]}"; do
exp=$(grep -w "^#= $user" "/usr/local/etc/xray/config.json" | cut -d ' ' -f 3 | sort | uniq)
d1=$(date -d "$exp" +%s)
d2=$(date -d "$now" +%s)
exp2=$(((d1 - d2) / 86400))
if [[ "$exp2" -le "0" ]]; then
sed -i "/^#= $user $exp/,/^},{/d" /usr/local/etc/xray/config.json
sed -i "/^#= $user $exp/,/^},{/d" /usr/local/etc/xray/config.json
rm -rf /var/www/html/vless/vless-$user.txt
rm -rf /user/log-vless-$user.txt
fi
done

##----- Auto Remove Trojan
data=($(cat /usr/local/etc/xray/config.json | grep '^#&' | cut -d ' ' -f 2 | sort | uniq))
now=$(date +"%Y-%m-%d")
for user in "${data[@]}"; do
exp=$(grep -w "^#& $user" "/usr/local/etc/xray/config.json" | cut -d ' ' -f 3 | sort | uniq)
d1=$(date -d "$exp" +%s)
d2=$(date -d "$now" +%s)
exp2=$(((d1 - d2) / 86400))
if [[ "$exp2" -le "0" ]]; then
sed -i "/^#& $user $exp/,/^},{/d" /usr/local/etc/xray/config.json
sed -i "/^#& $user $exp/,/^},{/d" /usr/local/etc/xray/config.json
rm -rf /var/www/html/trojan/trojan-$user.txt
rm -rf /user/log-trojan-$user.txt
fi
done

##----- Auto Remove Shadowsocks
data=($(cat /usr/local/etc/xray/config.json | grep '^#!' | cut -d ' ' -f 2 | sort | uniq))
now=$(date +"%Y-%m-%d")
for user in "${data[@]}"; do
exp=$(grep -w "^#! $user" "/usr/local/etc/xray/config.json" | cut -d ' ' -f 3 | sort | uniq)
d1=$(date -d "$exp" +%s)
d2=$(date -d "$now" +%s)
exp2=$(((d1 - d2) / 86400))
if [[ "$exp2" -le "0" ]]; then
sed -i "/^#! $user $exp/,/^},{/d" /usr/local/etc/xray/config.json
sed -i "/^#! $user $exp/,/^},{/d" /usr/local/etc/xray/config.json
rm -rf /var/www/html/shadowsocks/shadowsocks-$user.txt
rm -rf /user/log-shadowsocks-$user.txt
fi
done

##----- Auto Remove Shadowsocks 2022
data=($(cat /usr/local/etc/xray/config.json | grep '^#%' | cut -d ' ' -f 2 | sort | uniq))
now=$(date +"%Y-%m-%d")
for user in "${data[@]}"; do
exp=$(grep -w "^#% $user" "/usr/local/etc/xray/config.json" | cut -d ' ' -f 3 | sort | uniq)
d1=$(date -d "$exp" +%s)
d2=$(date -d "$now" +%s)
exp2=$(((d1 - d2) / 86400))
if [[ "$exp2" -le "0" ]]; then
sed -i "/^#% $user $exp/,/^},{/d" /usr/local/etc/xray/config.json
sed -i "/^#% $user $exp/,/^},{/d" /usr/local/etc/xray/config.json
rm -rf /var/www/html/shadowsocks2022/shadowsocks2022-$user.txt
rm -rf /user/log-shadowsocks-$user.txt
fi
done

##----- Auto Remove Socks5
data=($(cat /usr/local/etc/xray/config.json | grep '^#÷' | cut -d ' ' -f 2 | sort | uniq))
now=$(date +"%Y-%m-%d")
for user in "${data[@]}"; do
exp=$(grep -w "^#÷ $user" "/usr/local/etc/xray/config.json" | cut -d ' ' -f 3 | sort | uniq)
d1=$(date -d "$exp" +%s)
d2=$(date -d "$now" +%s)
exp2=$(((d1 - d2) / 86400))
if [[ "$exp2" -le "0" ]]; then
sed -i "/^#÷ $user $exp/,/^},{/d" /usr/local/etc/xray/config.json
sed -i "/^#÷ $user $exp/,/^},{/d" /usr/local/etc/xray/config.json
rm -rf /var/www/html/socks5/socks5-$user.txt
rm -rf /user/log-socks5-$user.txt
fi
done
systemctl restart xray

