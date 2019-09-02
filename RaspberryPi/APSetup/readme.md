# How to setup the Raspberry Pi

This will configure the rPi to have:

- A specific hostname
- New password
- Access via:
  - SSH
  - Filezilla
  - RealVNC
- Access point functionality

## Steps

1. Download and flash Raspian
2. Connect to keyboard, mouse and HDMI. Power on rPi
   1. Change password when prompted
   2. Download updates
   3. Enable SSH
   4. Change hostname
3. Copy scripts (including password files) using Filezilla
4. chmod +x .sh files
5. Run (in this order):
   1. aptget_all.sh
   2. accesspoint_setup.sh

### Notes:
- APpassword.txt is plaintext (no CR or LF)
bridgeSetup.txt will probably contain something like this:
````
static ip_address=192.168.1.100/24
static routers=192.168.1.1
static domain_name_servers=192.168.1.1
````
dhcpRange.txt will contain something like this:
````
192.168.1.101,192.168.1.119,255.255.255.0,24h
````
