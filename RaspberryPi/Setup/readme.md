# How to setup the Raspberry Pi

This will configure the rPi to have:

- A specific hostname
- New password
- Access via:
  - SSH
  - Filezilla
  - TightVNC
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
   2. tightvnc_setup.sh
   3. accesspoint_setup.sh

### Notea:
- APpassword.txt is plaintext (no CR or LF)
- To create TightVNCpasswd use the following command:
````
vncpasswd TightVNCpasswd
````
