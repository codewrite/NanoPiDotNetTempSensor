#!/bin/bash

mv .bash_aliases ~/.
sudo mv gpio-board-init.sh /usr/local/bin
sudo chmod +x /usr/local/bin/gpio-board-init.sh

if ! cat /etc/rc.local | grep 'gpio-board-init' >/dev/null; then
  sudo perl -i -0pe 's/(\nexit 0\n)$/\ngpio-board-init.sh\n\1/s' /etc/rc.local
fi
