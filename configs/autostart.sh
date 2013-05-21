#!/bin/bash
dwmstatus &
while true; do
  dwmstatus refresh
  xkb-switch --wait
done &

chromium &
urxvt &
skype &
alsactl init &
