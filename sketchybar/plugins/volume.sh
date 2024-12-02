#!/bin/sh

# The volume_change event supplies a $INFO variable in which the current volume
# percentage is passed to the script.

if [ "$SENDER" = "volume_change" ]; then
  VOLUME="$INFO"
  unset LABEL

  DEVICE_NAME="UR22"
  CONNECTED=$(ioreg -p IOUSB -w0 | grep -i "$DEVICE_NAME")

  if [ -n "$CONNECTED" ]; then
    ICON="UR22 􁏎"
  else 
    case "$VOLUME" in
      [6-9][0-9]|100) 
          ICON="􀊩" 
          LABEL="$VOLUME%"
      ;;
      [3-5][0-9]) 
          ICON="􀊧" 
          LABEL="$VOLUME%"
      ;;
      [1-9]|[1-2][0-9])
          ICON="􀊥"
          LABEL="$VOLUME%"
      ;;
      *) ICON="􀊣"; LABEL=""
    esac
  fi

  if [ -z "$LABEL" ]; then
    sketchybar --set "$NAME" icon="$ICON" label="$LABEL" \
                                        icon.padding_right=2 \
                                        label.padding_left=0  \
                                        label.padding_right=0
  else
    sketchybar --set "$NAME" icon="$ICON" label="$LABEL" \
                                        icon.padding_right=4 \
                                        label.padding_left=10  \
                                        label.padding_right=4

  fi
fi
