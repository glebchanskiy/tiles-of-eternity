#!/bin/bash

SPACE_SIDS=(1 2 3 4 5 6 7)

for sid in "${SPACE_SIDS[@]}"
do
  sketchybar --add space space.$sid left                                 \
             --set space.$sid space=$sid                                 \
                              label.font="sketchybar-app-font:Regular:12.0" \
                              label.padding_left=4                     \
                              label.padding_right=10                     \
                              icon.padding_right=4                     \
                              icon.padding_left=0                     \
                              padding_left=0 \
                              padding_right=4 \
                              label.y_offset=-1 \
                              script="$PLUGIN_DIR/space.sh"
done

sketchybar --add item space_separator left                             \
           --set space_separator icon=" "                                \
                                 icon.color=$ACCENT_COLOR \
                                 icon.padding_left=5                   \
                                 icon.padding_right=10                   \
                                 label.drawing=off                     \
                                 background.drawing=off                \
                                 script="$PLUGIN_DIR/space_windows.sh" \
           --subscribe space_separator space_windows_change
#
# sketchybar --add item space_separator left                             \
#            --set space_separator label.drawing=off background=off script="$PLUGIN_DIR/space_windows.sh" \
#            --subscribe space_separator space_windows_change
