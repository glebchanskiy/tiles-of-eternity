#!/bin/sh

# The volume_change event supplies a $INFO variable in which the current volume
# percentage is passed to the script.

INPUT_SOURCE=$(defaults read ~/Library/Preferences/com.apple.HIToolbox.plist AppleSelectedInputSources | grep '"KeyboardLayout Name"' | grep -o '[a-zA-Z]*' | sed -n '3p')

case "$INPUT_SOURCE" in
    "ABC")
        LABEL="en"
        ;;
    "Russion")
        LABEL="ru"
        ;;
    *)
        LABEL="хз"
        ;;
esac


sketchybar --set "$NAME" label="$LABEL"
