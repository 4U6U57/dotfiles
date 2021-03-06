#!/bin/bash
# bash_profile: part of the 4U6U57/dotfiles project
# Pretty much just sources bashrc safely
# Anything you were going to put here should probably go in .bashrc

sourcer() {
  # sources files that actually exist
  # shellcheck disable=SC1090
  [[ -r "$1" ]] && [[ -f "$1" ]] && source "$1"
}
export -f sourcer

sourcer ~/.bashrc

custom_user_startup() {
  # Cub Linux specific
  if [[ $HOSTNAME == "YOLOSWAGGER" ]]; then
    # Enable Natural (reversed/macOS style) scrolling on touchpad
    synclient VertScrollDelta=-111 HorizScrollDelta=-111
    # Lower start brightness
    xbacklight -set 10
    # Start slack client
    if command -v slack; then slack --startup; fi
  fi
}
[[ $USER == "avalera" ]] && custom_user_startup
