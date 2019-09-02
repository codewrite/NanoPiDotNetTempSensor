#!/usr/bin/env python
import time
import datetime
import serial

ser = serial.Serial(
    port='/dev/ttyUSB0',
    baudrate = 115200,
    parity=serial.PARITY_NONE,
    stopbits=serial.STOPBITS_ONE,
    bytesize=serial.EIGHTBITS,
    timeout=10
)

filename = datetime.datetime.utcnow().strftime("TL%Y%m%d.txt")
fullname = "/home/pi/Documents/NanoPiDotNetTempSensor/RaspberryPi/" + filename
file = open(fullname, "wt")

while 1:
    data = ser.readline()
    t = time.gmtime()
    line = time.strftime("%H:%M:%S;", t)
    line += str((t.tm_hour*60+t.tm_min)*60+t.tm_sec)
    line += ";" + str(data.strip(), "utf-8")
    file.write(line + "\n")
    file.flush()

