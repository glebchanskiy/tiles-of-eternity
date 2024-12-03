#!/bin/bash

sketchybar --add item vpn right \
           --set vpn update_freq=2 \
                              label.padding_right=4                     \
                              icon.padding_right=0                     \
                              icon.padding_left=4                    \
                         script="$PLUGIN_DIR/vpn.sh" \
