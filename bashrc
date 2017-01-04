# Bash config

# If not running interactively, don't do anything
case $- in
  *i*)
    ;;
  *)
    return;;
esac

sourcer() {
  # sources files that actually exist
  [[ -r $1 ]] && [[ -f $1 ]] && source $1
}

# Host specific config
Jekyll=0 # If we need to install Jekyll
CubLinux=0 # If distro is Cub Linux
case $HOSTNAME in
  (unix*.lt.ucsc.edu)
    ;;
  (VALERAPCWK)
    CubLinux=1
    ;;
  (YOLOSWAG)
    ;;
  (YOLOSWAGGER)
    CubLinux=1
    ;;
esac

# PATH
export PATH="$PATH:$HOME/bin"
export PATH="$PATH:."
export PATH="$PATH:$HOME/sbin"

# Vim as default editor
export VISUAL="vim"
export EDITOR="vim"

# Ruby for Jekyll
if [[ $Jekyll -eq 1 ]]; then
  export PATH="$HOME/.rbenv/bin:$PATH"
  eval "$(rbenv init -)"
  export PATH="$HOME/.rbenv/plugins/ruby-build/bin:$PATH"
fi

# Cub Linux specific
if [[ $HOSTNAME == "YOLOSWAGGER" ]]; then
  # Enable Natural (reversed/macOS style) scrolling on touchpad
  synclient VertScrollDelta=-111 HorizScrollDelta=-111
  # Lower start brightness
  xbacklight -set 10
  # Start slack client
  if which slack >/dev/null 2>&1; then slack --startup; fi
fi

# External scripts
sourcer ~/.bash_aliases
sourcer ~/.bash_prompt

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
