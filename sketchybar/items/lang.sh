#!/bin/bash

sketchybar --add item lang right \
           --set lang script="$PLUGIN_DIR/lang.sh" \
           --subscribe lang input_method_changed
