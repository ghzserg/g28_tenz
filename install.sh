#!/bin/bash

CONF=/opt/config/printer.base.cfg

awk '
/^\[stepper_z\]/, /^\[/ {
  if (/^\[stepper_z\]/) { in_z=1; print; next }
  if (/^\[/) { in_z=0; print; next }
  if (in_z && /^[^;[:space:]].*position_endstop[[:space:]]*:/) {
    print ";" $0
    next
  }
}
{ print }
' ${CONF} > /tmp/tmp && mv /tmp/tmp $CONF && echo "Disable position_endstop in [stepper_z] printer.base.cfg"

echo "G28_tenz installed"
