#!/bin/bash

sketchybar --add item clock right \
           --set clock \
                          update_freq=15 \
                          script="$PLUGIN_DIR/clock.sh" \
           --subscribe clock system_woke