#!/bin/bash

sudo apt-get install samba samba-common-bin -y
sudo mv /etc/samba/smb.conf /etc/samba/smb.conf.orig
sudo mv smb.conf /etc/samba/smb.conf
sudo smbpasswd -a pi
sudo systemctl restart smbd
