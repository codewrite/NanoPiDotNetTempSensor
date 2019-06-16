#!/bin/bash

# See: https://www.raspberrypi.org/documentation/configuration/wireless/access-point.md

sudo systemctl stop hostapd

if ! cat /etc/dhcpcd.conf | grep 'denyinterfaces wlan0' >/dev/null; then
  sudo perl -i -0pe 's/$/denyinterfaces wlan0\n/s' /etc/dhcpcd.conf
fi
if ! cat /etc/dhcpcd.conf | grep 'denyinterfaces eth0' >/dev/null; then
  sudo perl -i -0pe 's/$/denyinterfaces eth0\n/s' /etc/dhcpcd.conf
fi

sudo brctl addbr br0
sudo brctl addif br0 eth0

if ! cat /etc/network/interfaces | grep '# Bridge setup' >/dev/null; then
  sudo perl -i -0pe 's/$/# Bridge setup\nauto br0\niface br0 inet manual\nbridge_ports eth0 wlan0\n/s' /etc/network/interfaces
fi

perl -i -0pe 's/((^|\n)ssid=).*?($|\n)/\1'$(cat /etc/hostname)'\2/s' hostapd.conf
perl -i -0pe 's/((^|\n)wpa_passphrase=).*?($|\n)/\1'$(cat APpasswd.txt)'\2/s' hostapd.conf
sudo mv hostapd.conf /etc/hostapd/hostapd.conf
sudo perl -i -pe 's/#DAEMON_CONF.*$/DAEMON_CONF=\"\/etc\/hostapd\/hostapd.conf\"/s' /etc/default/hostapd

sudo systemctl unmask hostapd
sudo systemctl enable hostapd
sudo systemctl start hostapd

sudo perl -i -pe 's/#net.ipv4.ip_forward=1/net.ipv4.ip_forward=1/s' /etc/sysctl.conf
sudo iptables -t nat -A  POSTROUTING -o eth0 -j MASQUERADE
sudo sh -c "iptables-save > /etc/iptables.ipv4.nat"
if ! cat /etc/rc.local | grep 'iptables-restore' >/dev/null; then
  sudo perl -i -0pe 's/$/iptables-restore < \/etc\/iptables.ipv4.nat\n/s' /etc/rc.local
fi

#sudo perl -i -pe 's/^.*$/<hostname>/g' /etc/hostname
#sudo perl -i -pe 's/raspberrypi/<hostname>/g' /etc/hosts
