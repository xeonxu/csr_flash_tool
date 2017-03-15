#!/bin/bash
cat <<_EOT_ | sudo tee -a /etc/udev/rules.d/99-ftdi.rules
# FT232R
SUBSYSTEM=="usb", ATTRS{idVendor}=="0403", ATTRS{idProduct}=="6001", MODE="0666", SYMLINK+="ft232"
_EOT_

