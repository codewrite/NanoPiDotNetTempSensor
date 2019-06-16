#!/bin/bash

if ! cat /etc/rc.local | grep 'tightvncserver' >/dev/null; then
  sudo perl -i -0pe 's/(fi\n)(\nexit)/$1su - pi -c '"'"'\/usr\/bin\/tightvncserver :1\'"'"'$2/gms' /etc/rc.local
fi
if [ ! -e ~/.vnc ]; then mkdir ~/.vnc; fi
if [ ! -e ~/.vnc/passwd ]; then mv TightVNCpasswd ~/.vnc/passwd; fi
chmod u=rw,g=,o= ~/.vnc/passwd
