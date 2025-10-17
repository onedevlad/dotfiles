#!/bin/bash

if [[ "$1" == "mobile" ]]; then
  xrandr \
    --output HDMI-1-0 --off
else
  xrandr \
    --output HDMI-1-0 --auto \
    --output eDP-1 --primary --auto --below HDMI-1-0
fi
