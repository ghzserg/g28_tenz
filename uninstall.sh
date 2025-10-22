#!/bin/sh

CONF=/opt/config/printer.base.cfg

awk '
/^\[stepper_z\]/ {
    in_z = 1
    print
    next
}
/^\[/ && in_z {
    in_z = 0
    print
    next
}
/^\[/ && !in_z {
    print
    next
}
in_z && /position_endstop[[:space:]]*:/ {
    next
}
{ print }
' ${CONF} > tmp.cfg && \
awk '
/^\[stepper_z\]/ {
    print
    print "position_endstop: 220"
    next
}
{ print }
' /tmp/tmp > ${CONF} && rm /tmp/tmp && echo "Enable position_endstop in [stepper_z] printer.base.cfg"

echo "G28_tenz uninstalled"
