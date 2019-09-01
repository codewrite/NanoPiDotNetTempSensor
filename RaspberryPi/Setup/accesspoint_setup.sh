#!/bin/bash

# See: https://www.raspberrypi.org/documentation/configuration/wireless/access-point.md

sudo systemctl stop hostapd

if ! cat /etc/dhcpcd.conf | grep '\ndenyinterfaces wlan0(\n|$)' >/dev/null; then
  sudo perl -i -0pe 's/$/\ndenyinterfaces wlan0/s' /etc/dhcpcd.conf
fi
if ! cat /etc/dhcpcd.conf | grep '\ndenyinterfaces eth0(\n|$)' >/dev/null; then
  sudo perl -i -0pe 's/$/\ndenyinterfaces eth0/s' /etc/dhcpcd.conf
fi
if ! cat /etc/dhcpcd.conf | grep 'interface br0' >/dev/null; then
  # TODO: This doesn't seem to work. Find out why and fix
  sudo perl -i -0pe 's/$/interface br0\n'$(cat bridgeSetup.txt)'\n/s' /etc/dhcpcd.conf
fi

sudo brctl addbr br0
sudo brctl addif br0 eth0

if ! cat /etc/network/interfaces | grep '\n# Bridge setup\n' >/dev/null; then
  sudo perl -i -0pe 's/$/\n# Bridge setup\nauto br0\niface br0 inet manual\nbridge_ports eth0 wlan0/s' /etc/network/interfaces
fi

perl -i -0pe 's/((^|\n)ssid=).*?($|\n)/\1'$(cat /etc/hostname)'\2/s' hostapd.conf
perl -i -0pe 's/((^|\n)wpa_passphrase=).*?($|\n)/\1'$(cat APpasswd.txt)'\2/s' hostapd.conf
sudo mv hostapd.conf /etc/hostapd/hostapd.conf
sudo perl -i -pe 's/#(DAEMON_CONF).*$/\1=\"\/etc\/hostapd\/hostapd.conf\"/s' /etc/default/hostapd

sudo systemctl unmask hostapd
sudo systemctl enable hostapd
sudo systemctl start hostapd

sudo perl -i -pe 's/#(net\.ipv4\.ip_forward=1)/\1/s' /etc/sysctl.conf
sudo iptables -t nat -A  POSTROUTING -o eth0 -j MASQUERADE
sudo sh -c "iptables-save > /etc/iptables.ipv4.nat"
if ! cat /etc/rc.local | grep 'iptables-restore' >/dev/null; then
  sudo perl -i -0pe 's/(\nexit 0\n)$/\niptables-restore < \/etc\/iptables.ipv4.nat\n\1/s' /etc/rc.local
fi

if ! test -f /etc/dnsmasq.conf.orig; then
  sudo mv /etc/dnsmasq.conf /etc/dnsmasq.conf.orig
fi

if ! cat /etc/dnsmasq.conf | grep 'interface=br0' >/dev/null; then
  # TODO: Test this and make sure it works in all cases
  sudo touch /etc/dnsmasq.conf
  echo "#dhcp config\n" | sudo tee -a /etc/dnsmasq.conf
  sudo perl -i -0pe 's/$/interface=br0\ndhcp-range='$(cat dhcpRange.txt)'\n/s' /etc/dnsmasq.conf
  sudo systemctl reload dnsmasq
fi

# Force VNC to use 1024x768 rather than default 720x480
sudo perl -i -pe 's/(HDMI mode) \(this will force VGA\)\n/\1 (1024x768 60Hz)\n/s' /boot/config.txt
sudo perl -i -0pe 's/\n#(hdmi_group)=1\n/\n\1=2\n/s' /boot/config.txt
sudo perl -i -0pe 's/\n#(hdmi_mode)=1\n/\n\1=16\n/s' /boot/config.txt

#sudo perl -i -pe 's/^.*$/<hostname>/g' /etc/hostname
#sudo perl -i -pe 's/raspberrypi/<hostname>/g' /etc/hosts
