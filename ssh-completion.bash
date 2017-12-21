#!/bin/bash

##
# @file ssh-completion.bash
# @brief Expands ssh hosts with bash-completion
# @author nelson (via StackExchange)
#
# See https://apple.stackexchange.com/a/168168
#
# @version
# @date 2017-11-30
#

_complete_ssh_hosts ()
{
  COMPREPLY=()
  cur="${COMP_WORDS[COMP_CWORD]}"
  comp_ssh_hosts=$(cut -f 1 -d ' ' ~/.ssh/known_hosts | \
    sed -e s/,.*//g | \
    grep -v '^#' | \
    uniq | \
    grep -v '\['; \
    grep "^Host " ~/.ssh/config | \
    awk '{print $2}'
  )
  compgen -W "${comp_ssh_hosts}" -- "$cur" | read -r -a COMPREPLY
  return 0
}
complete -F _complete_ssh_hosts ssh
