#!/bin/bash
# bashrc: part of the 4U6U57/dotfiles project
# Configuration for bash, sources a lot of other files

# If not running interactively, don't do anything
case $- in
  *i*)
    ;;
  *)
    return;;
esac

# Duplicate definition of the one found in .bash_profile
sourcer() {
  # sources files that actually exist
  # shellcheck disable=SC1090
  [[ -r "$1" ]] && [[ -f "$1" ]] && source "$1"
}
export -f sourcer

# PATH
export PATH="$PATH:$HOME/bin"
export PATH="$PATH:."
export PATH="$PATH:$HOME/sbin"

# Vim as default editor
export VISUAL="vim"
export EDITOR="vim"

# External scripts
sourcer ~/.bash_aliases
[[ $- = *i* ]] && sourcer ~/bin/liquidprompt/liquidprompt

# Autocompletion
CompletionDir=~/.completion
if [[ -d "$CompletionDir" ]]; then
  for Script in "$CompletionDir"/*; do
    sourcer "$Script"
  done
fi

# From default bashrc in Ubuntu

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# Bash autocompletion
shopt -s cdspell # Autocorrect filenames
shopt -s nocaseglob # Case insensitive autocorrect

# Adding open-window as a browser for Bash for Windows
[[ $(uname -r) == *Microsoft ]] && export BROWSER=${BROWSER:wsl-open}

# nvm stuff
export NVM_DIR="$HOME/.nvm"
sourcer "$NVM_DIR/nvm.sh"  # This loads nvm
sourcer "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
