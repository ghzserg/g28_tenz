#!/bin/sh

source /opt/config/mod/.shell/0.sh
CONF=/opt/config/printer.base.cfg

awk '
  /^\[stepper_z\]/ {
    in_z = 1
    print
    next
  }
  /^\[/ {
    in_z = 0
    print
    next
  }
  in_z && /^[[:space:]]*position_endstop[[:space:]]*:/ && !/^[[:space:]]*;/ {
    print ";" $0
    next
  }
  { print }
' ${CONF} > /tmp/tmp && mv /tmp/tmp $CONF && echo "Disable position_endstop in [stepper_z] printer.base.cfg"

PIN="PD2"
[ ${FF5X} -eq 0 ] && PIN="PB15"

echo "[gcode_button _zstop]
pin: $PIN
press_gcode:

" >zstop.cfg


echo "G28_tenz installed"
