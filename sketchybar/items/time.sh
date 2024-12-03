#!/bin/bash

sketchybar --add item time right \
  --set time update_freq=1 \
        label.padding_left=0\
        label.padding_right=8\
  script='sketchybar --set $NAME label="$(date "+%H:%M")"'