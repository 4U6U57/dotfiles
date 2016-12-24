#!/bin/bash

CRONFILE="~/.crontab"
SWAPFILE="~/.crontab.swp"

crontab -l > $SWAPFILE
if [[ -e $SWAPFILE ]] && diff -q $SWAPFILE $CRONFILE; then
  echo "Error: Installed crontab differs from .crontab fron dotfiles"
else
  crontab -e
  crontab -l > $CRONFILE
fi
rm -f $SWAPFILE
