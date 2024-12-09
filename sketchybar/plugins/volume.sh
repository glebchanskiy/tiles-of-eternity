#!/bin/sh

# The volume_change event supplies a $INFO variable in which the current volume
# percentage is passed to the script.

if [ "$SENDER" = "volume_change" ]; then
  VOLUME="$INFO"
  unset LABEL

  DEVICE_TYPE=$(system_profiler SPAudioDataType | awk '/Default Output Device: Yes/ {output_device = 1} output_device && /Transport/ {split($0, a, ": "); print a[2]; output_device = 0}')
  DEVICE_NAME=$(system_profiler SPAudioDataType | awk '/Default Output Device: Yes/ {print prev2} {prev2=prev; prev=$0}' | sed 's/:$//' | sed 's/^[[:space:]]*//;s/[[:space:]]*$//' | sed 's/ USB//')
  ICON="􀊩"
  if [ "$DEVICE_TYPE" = "USB" ]; then
    ICON="􁏎 $DEVICE_NAME"
  fi
  if [ "$DEVICE_TYPE" = "Bluetooth"  ]; then
    ICON="􀑈"
  fi
    case "$VOLUME" in
    [6-9][0-9] | 100)
      LABEL="$VOLUME%"
      ;;
    [3-5][0-9])
      LABEL="$VOLUME%"
      ;;
    [1-9] | [1-2][0-9])
      LABEL="$VOLUME%"
      ;;
    *)
      LABEL=""
      ;;
    esac

  if [ -z "$LABEL" ]; then
    sketchybar --set "$NAME" icon="$ICON" label="$LABEL" \
      icon.padding_right=2 \
      label.padding_left=0 \
      label.padding_right=0
  else
    sketchybar --set "$NAME" icon="$ICON" label="$LABEL" \
      icon.padding_right=4 \
      label.padding_left=10 \
      label.padding_right=4

  fi
fi
