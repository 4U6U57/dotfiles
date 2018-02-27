#!/bin/bash

domain="$1"
ssh_config=~/.ssh/config
ssh_found=true
# Filter out sshconfig lines that start with "Host" or "HostName"
while read -r ssh_line; do
  read -r -a ssh_array <<<"${ssh_line}"
  ssh_optcode="${ssh_array[0]}"
  if [[ ${ssh_optcode^^} == HOST ]]; then
    # Host
    ssh_found=false
    for ssh_index in $(seq 1 $((${#ssh_array[@]} - 1))); do
      ssh_host=${ssh_array[$ssh_index]}
      # shellcheck disable=SC2053
      if [[ $domain == $ssh_host ]]; then
        ssh_found=true
        break
      fi
    done
  elif $ssh_found && [[ ${ssh_optcode^^} == HOSTNAME ]]; then
    # HostName, but only if ssh_found is true (the last Host entry matched)
    echo "${ssh_array[1]//%h/$domain}"
    exit
  fi
done < <(grep -Pi "^\\s*Host(Name)?\\s+" $ssh_config)
