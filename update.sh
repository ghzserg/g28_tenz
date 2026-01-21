#!/bin/sh

source /opt/config/mod/.shell/0.sh

PIN="!PD2"
[ ${AD5X} -eq 0 ] && PIN="!PB15"

echo "[gcode_button _zstop]
pin: $PIN
press_gcode:

" >zstop.cfg
