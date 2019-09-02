# GPIO Board for the Raspberry Pi

The GPIO board provides two switches, two LEDs and a FAN control ouput (0 for off, 1 for on)

## Installation

1. Copy all files in this folder using Filezilla
2. chmod +x .sh files
3. Run:
   1. gpio_setup.sh
4. Reboot

## Commands

The following commands are then available in bash:

- ledred <0|1>, e.g. `ledred 0`
- ledgreen <0|1>
- fan <0|1>
- switch<1|2>, e.g. `echo $(switch1)`
- temp will display the CPU temperature (alias for `vcgencmd measure_temp`)

