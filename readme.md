# Seting up and using Raspberry Pi and Arduino

The purpose of this repo is to setup a Raspberry Pi and install the Arduino IDE on it.
The Raspberry Pi is set up as an access point with DHCP server, and will forward the internet
connection if the ethernet port is connected to a router which is connected to the internet.

There are several subfolders describing the individual setup steps:

- [Access Point Setup](RaspberryPi/APSetup/readme.md)
- [GPIO Board Setup](RaspberryPi/GpioSetup/readme.md)
- [Miscellaneous Setup](RaspberryPi/FunSetup/readme.md)

The GPIO board is an addon board that has two buttons, two LEDs and a Fan control circuit
that allows the fan to be turned on or off.
