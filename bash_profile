#!/bin/bash
# bash_profile: part of the 4U6U57/dotfiles project
# Pretty much just sources bashrc safely
# Anything you were going to put here should probably go in .bashrc

sourcer() {
  # sources files that actually exist
  [[ -r $1 ]] && [[ -f $1 ]] && source $1
}
export -f sourcer

sourcer ~/.bashrc
