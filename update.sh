#!/bin/sh

source /opt/config/mod/.shell/0.sh

PIN="!PB15"
[ ${AD5X} -eq 1 ] && PIN="!PD2"
[ ${AD5M} -eq 1 ] && PIN="!PB15"

echo "[gcode_button _zstop]
pin: $PIN
press_gcode:

" >zstop.cfg
