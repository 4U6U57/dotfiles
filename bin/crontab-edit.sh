#!/bin/bash
# crontab.sh: part of the 4U6U57/dotfiles project
# Editor and installer for the .crontab file
# Emulates `crontab -e`, but maintains consistency with .crontab

CRONFILE=~/.crontab
SWAPFILE=$(mktemp)

crontab -l >"$SWAPFILE"
if [[ -e "$SWAPFILE" ]] && ! diff "$SWAPFILE" "$CRONFILE"; then
  echo "Error: Installed crontab differs from .crontab fron dotfiles"
else
  crontab -e
  crontab -l >"$CRONFILE"
fi
rm -f "$SWAPFILE"
