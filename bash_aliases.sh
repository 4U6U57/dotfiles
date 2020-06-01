#!/bin/bash
# bash_aliases: part of the 4U6U57/dotfiles project
# A subset of the bashrc configuration for setting bash aliases
# Define shortcuts for commonly used commands here
# INSTALL: add `source ~/.bash_aliases` or equivalent in .bashrc

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
  if test -r ~/.dircolors; then
    eval "$(dircolors -b ~/.dircolors)"
  else
    eval "$(dircolors -b)"
  fi
  alias ls='ls --color=auto'
  #alias dir='dir --color=auto'
  #alias vdir='vdir --color=auto'

  alias grep='grep --color=auto'
  alias fgrep='fgrep --color=auto'
  alias egrep='egrep --color=auto'
fi

# More colors
alias less="less --RAW-CONTROL-CHARS"

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Make opening files more like Mac
alias open='xdg-open'

# GitLab create repo
if [ -e "$HOME/bin/git-usernames" ]; then
  source ~/bin/git-usernames
  [ ! -z "$GITLAB_USERNAME" ] && alias gitlab-init='git push --set-upstream git@gitlab.com:$GITLAB_USERNAME/$(git rev-parse --show-toplevel | xargs basename).git $(git rev-parse --abbrev-ref HEAD)'
fi
