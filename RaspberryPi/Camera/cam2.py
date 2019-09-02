import time
import picamera

#camera.rotation = 90

with picamera.PiCamera() as camera:
    for filename in camera.record_sequence(
            'clip%02d.h264' % i for i in range(5)):
        print('Recording to %s' % filename)
        camera.wait_recording(30)
time.sleep(1)
