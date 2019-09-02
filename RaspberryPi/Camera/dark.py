import picamera
from time import sleep
from fractions import Fraction

with picamera.PiCamera() as camera:
    camera.resolution = (1280, 720)
    camera.rotation = -90
    # Set a framerate of 1/6fps, then set shutter
    # speed to 6s and ISO to 800
    camera.framerate = Fraction(2, 1)
    camera.shutter_speed = 500000
    camera.exposure_mode = 'off'
    camera.iso = 800
    # Give the camera a good long time to measure AWB
    # (you may wish to use fixed AWB instead)
    sleep(4)
    # Finally, capture an image with a 6s exposure. Due
    # to mode switching on the still port, this will take
    # longer than 6 seconds
    camera.capture('dark.jpg')
    sleep(3)