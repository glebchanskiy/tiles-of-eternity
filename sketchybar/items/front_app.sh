#!/bin/bash

sketchybar --add item front_app left \
           --set front_app       background.border_width=0 \
                                 background.border_color=$WHITE \
                                 icon.color=$WHITE \
                                 icon.font="sketchybar-app-font:Regular:12.0" \
                                 label.color=$WHITE \
                                 script="$PLUGIN_DIR/front_app.sh"            \
                                 icon.padding_right=0 \
           --subscribe front_app front_app_switched
