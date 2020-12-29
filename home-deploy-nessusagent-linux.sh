#!/usr/bin/sudo bash
# Installation Nessus Agent v.8.2.2
# Variables
nessus_installer_url="https://github.com/oakvilov/Repository/raw/main/NessusAgent-8.2.2-ubuntu1110_amd64.deb"
nessus_key="be6e817a936774295bcda98fd1dc6f3c8238d2b6fae7ae5bfeea7925689d83c8"
nessus_host="nessus.levi9.com --port=8834"
nessus_group="Ukraine-Clients"
Your_Hostname="${HOSTNAME}"


# Downloading Nessus Agent
wget --no-check-certificate $nessus_installer_url

# Unpacking and installing Nessus Agent
dpkg -i NessusAgent-8.2.2-ubuntu1110_amd64.deb

# Configuring Nessus Agent Settings
/opt/nessus_agent/sbin/nessuscli agent link --key=$nessus_key --name=$Your_Hostname --groups=$nessus_group --host=$nessus_host

# Starting Nessus Agent
/etc/init.d/nessusagent start
