#!/bin/bash

current_space=$(/opt/homebrew/bin/yabai -m query --spaces --space | /opt/homebrew/bin/jq '.index')

if [ "$current_space" -eq 9 ]; then
  echo "Current space is 9. No action will be performed."
  exit 0
fi

space1=$current_space
space2=$1

if [ -z "$space2" ]; then
  echo "Usage: $0 <space2_index>"
  exit 1
fi

windows_space1=$(/opt/homebrew/bin/yabai -m query --windows --space $space1 | /opt/homebrew/bin/jq -r '.[].id')
windows_space2=$(/opt/homebrew/bin/yabai -m query --windows --space $space2 | /opt/homebrew/bin/jq -r '.[].id')

for window_id in $windows_space1; do
  /opt/homebrew/bin/yabai -m window "$window_id" --space $space2
done

for window_id in $windows_space2; do
  /opt/homebrew/bin/yabai -m window "$window_id" --space $space1
done

yabai -m space --focus $space1

