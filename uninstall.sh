#!/bin/bash

CONF=/opt/config/printer.base.cfg

awk '
/^\[stepper_z\]/ {
  in_z = 1
  print
  next
}
/^\[/ && in_z {
  print "position_endstop: 220"
  in_z = 0
}
/^\[/ && !in_z { print; next }
in_z {
  if (/^[[:space:]]*;?[[:space:]]*position_endstop[[:space:]]*:/) next
  print
  next
}
!in_z { print }
END { if (in_z) print "position_endstop: 220" }
' ${CONF} > /tmp/tmp && mv /tmp/tmp $CONF && echo "Enable position_endstop in [stepper_z] printer.base.cfg"

echo "G28_tenz uninstalled"
