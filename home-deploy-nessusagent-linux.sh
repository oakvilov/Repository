#!/usr/bin/sudo bash
# Installation Nessus Agent v.8.13.1
# Variables
nessus_installer_url="https://levi9-my.sharepoint.com/:u:/r/personal/o_akvilov_levi9_com/Documents/Nessus/Nessus-8.13.1-ubuntu1110_amd64.deb?csf=1&web=1&e=tpBlNe"
nessus_key="be6e817a936774295bcda98fd1dc6f3c8238d2b6fae7ae5bfeea7925689d83c8"
nessus_host="nessus.levi9.com --port=8834"
nessus_group="Ukraine-Clients"
Your_Hostname="${HOSTNAME}"
y="\033[1;33m"
t="\033[0m"

#/opt/nessus_agent/sbin/nessuscli agent link --key=be6e817a936774295bcda98fd1dc6f3c8238d2b6fae7ae5bfeea7925689d83c8 --name=YourHostname --groups="Ukraine-Laptops" --host=nessus.levi9.com --port=8834

#echo -ne "${y}Downloading Nessus Agent${t}\n"
wget --no-check-certificate $nessus_installer_url

#echo -ne "${y}Unpacking and installing Nessus Agent${t}\n"
dpkg -i Nessus-8.13.1-ubuntu1110_amd64.deb

#echo -ne "${y}Configuring Nessus Agent Settings${t}\n"
/opt/nessus_agent/sbin/nessuscli agent link --key=$nessus_key --name=$Your_Hostname --groups=$nessus_group --host=$nessus_host

#echo -ne "${y}Starting Nessus Agent${t}\n"
/etc/init.d/nessusagent start
