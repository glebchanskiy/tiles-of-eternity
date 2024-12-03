#!/bin/bash

sketchybar --add item calendar right \
           --set calendar \
                          update_freq=15 \
                          script="$PLUGIN_DIR/calendar.sh" \
           --subscribe calendar system_woke
