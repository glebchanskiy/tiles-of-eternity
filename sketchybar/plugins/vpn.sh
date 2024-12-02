#!/bin/sh

CISCO=$(ifconfig -a | grep 'flags=80d1<UP,POINTOPOINT,RUNNING,NOARP,MULTICAST> mtu')
WG=$(scutil --nc list | grep -E 'Connected.*glebchanskiy_wb')
TB=$(scutil --nc list | grep -E 'Connected.*TunnelBear')

# Определение значка/лейбла для каждого типа VPN
if [[ -n "$CISCO" ]]; then
  ICON="􁅏" # Значок для Cisco VPN
  LABEL="cisco"
  sketchybar --set "$NAME" icon="$ICON" label="$LABEL" drawing=on
elif [[ -n "$WG" ]]; then
  ICON="􀀰" # Значок для WireGuard
  LABEL="guard"
  sketchybar --set "$NAME" icon="$ICON" label="$LABEL" drawing=on
elif [[ -n "$TB" ]]; then
  ICON="􀲭" # Значок для TunnelBear
  LABEL="tunnel"
  sketchybar --set "$NAME" icon="$ICON" label="$LABEL" drawing=on
else
  sketchybar --set "$NAME" drawing=off
fi

