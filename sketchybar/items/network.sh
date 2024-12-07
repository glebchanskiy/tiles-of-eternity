#!/bin/bash



sketchybar 	--add item network right 							\
			--set network update_freq=1 \
                          script="$PLUGIN_DIR/network.sh" \
                          label="⬇ 0 kbps  ⬆ 0 kbps"\
                           icon.padding_left=0 \
                            icon.padding_right=0 \
                            label.padding_left=0 \
                            label.padding_right=2 \