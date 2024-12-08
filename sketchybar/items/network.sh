#!/bin/bash



sketchybar 	--add item network right 							\
			--set network update_freq=3 \
                          script="$PLUGIN_DIR/network.sh" \
                          label="⬇ 0 kb  ⬆ 0 kb"\
                           icon.padding_left=0 \
                            icon.padding_right=0 \
                            label.padding_left=0 \
                            label.padding_right=4 \
