# Additional Setup, Bugs and other notes

## Addtional Setup

_Note: Don't use apt-get install - this will install a vary old verion of Arduino_

To setup Arduino do this:

1. Download the latest version of Arduino (Linux ARM 32 bits) from https://arduino.cc (on the Raspberry Pi using Chromium)
2. Run the following commands:
````
cd Downloads/
tar -xf arduino-1.8.9-linuxarm.tar.xz
sudo mv arduino-1.8.9 /opt
sudo /opt/arduino-1.8.9/install.sh
````
_** Note the version you have downloaded will probably be different_

You will get this error (on version 1.8.9):
````
Adding desktop shortcut, menu item and file associations for Arduino IDE...
rm: cannot remove '/usr/local/bin/arduino': No such file or directory
Removing symlink failed. Hope that's OK. If not then rerun as root with sudo.

rm: cannot remove '/usr/local/bin/arduino': No such file or directory
Removing symlink failed. Hope that's OK. If not then rerun as root with sudo.
touch: cannot touch '/root/.config/mimeapps.list': No such file or directory
/usr/bin/xdg-mime: 848: /usr/bin/xdg-mime: cannot create /root/.config/mimeapps.list.new: Directory nonexistent

 done!
````

## Bugs

1. In APSetup, VNC resolution doesn't seem to be setup correctly. Workaround is to set the resolution manually from raspi-config, either via SSH or VNC.
