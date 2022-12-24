#!/bin/bash

clear
NUMBER_OF_CLIENTS=$(grep -c -E "^#% " "/usr/local/etc/xray/config.json")
if [[ ${NUMBER_OF_CLIENTS} == '0' ]]; then
clear
echo -e "${BB}————————————————————————————————————————————————————${NC}"
echo -e "          ${WB}Delete Shadowsocks 2022 Account${NC}           "
echo -e "${BB}————————————————————————————————————————————————————${NC}"
echo -e "  ${YB}You have no existing clients!${NC}"
echo -e "${BB}————————————————————————————————————————————————————${NC}"
read -n 1 -s -r -p "Press any key to back on menu"
shadowsocks2022
fi

clear
echo -e "${BB}————————————————————————————————————————————————————${NC}"
echo -e "          ${WB}Delete Shadowsocks 2022 Account${NC}           "
echo -e "${BB}————————————————————————————————————————————————————${NC}"
echo -e " ${YB}User  Expired${NC}  " 
echo -e "${BB}————————————————————————————————————————————————————${NC}"
grep -E "^#% " "/usr/local/etc/xray/config.json" | cut -d ' ' -f 2-3 | column -t | sort | uniq
echo ""
echo -e "${YB}tap enter to go back${NC}"
echo -e "${BB}————————————————————————————————————————————————————${NC}"
read -rp "Input Username : " user
if [ -z $user ]; then
shadowsocks2022
else
exp=$(grep -wE "^#% $user" "/usr/local/etc/xray/config.json" | cut -d ' ' -f 3 | sort | uniq)
sed -i "/^#% $user $exp/,/^},{/d" /usr/local/etc/xray/config.json
rm -rf /var/www/html/shadowsocks2022/shadowsocks2022-$user.txt
rm -rf /user/log-ss2022-$user.txt
systemctl restart xray
clear
echo -e "${BB}————————————————————————————————————————————————————${NC}"
echo -e "      ${WB}Shadowsocks 2022 Account Success${NC} Deleted${NC}      "
echo -e "${BB}————————————————————————————————————————————————————${NC}"
echo -e " ${YB}Client Name :${NC} $user"
echo -e " ${YB}Expired On  :${NC} $exp"
echo -e "${BB}————————————————————————————————————————————————————${NC}"
echo ""
read -n 1 -s -r -p "Press any key to back on menu"
clear
shadowsocks2022
fi
