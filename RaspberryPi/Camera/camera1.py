import picamera
from time import sleep
from fractions import Fraction

with picamera.PiCamera() as camera:
    camera.resolution = (1280, 720)
    camera.rotation = 0
    #camera.framerate = Fraction(1,6)
    #camera.shutter_speed = 1000000
    #camera.exposure_mode = 'off'
    #camera.iso = 800
    #sleep(3)
    camera.capture('image.jpg')
