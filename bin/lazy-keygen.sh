#!/bin/bash

UserName=$USER
UserFullName=$(git config --get user.name)
[[ -z $UserFullName ]] && UserFullName=$(getent passwd "$UserName" | cut -d ':' -f 5 | cut -d ',' -f 1)
UserEmail=$(git config --get user.email)
HostName=$HOSTNAME

PrintHelp() {
  echo "$(basename "$0"): Key generator for lazy"
  echo -e "
  \\t-s\\tGenerate SSH key with ssh-keygen
  \\t-g\\tGenerate GPG key with gpg --gen-key
  \\t-u\\tPrints out generated user info that would be used
  \\t-h\\tHelp, prints this message
  "
}
[[ -z $* ]] && PrintHelp

while getopts "sguh" opt; do
  case $opt in
    (s)
      KeyLocation=~/.ssh/id_rsa
      if [[ -e "$KeyLocation" ]]; then
        echo "There is already a key at $KeyLocation."
        echo -n "(D)elete it and regenerate, (S)elect other location, or (C)ancel (default): "
        read -r -t 10 Input
        case $Input in
          (D|d)
            echo "Deleting $KeyLocation and regenerating."
            ;;
          (S|s)
            echo -n "Enter in the new key location: "
            read -r -t 60 KeyLocation
            [[ -z "$KeyLocation" ]] && echo "You did not enter in a location, quitting." && exit
            KeyLocation=$(dirname "$KeyLocation")/$(basename "$KeyLocation" .pub)
            ;;
          (*)
            echo "
            Okay, not creating a new SSH key.
            Here is your current SSH public key:
            "
            cat "$KeyLocation.pub"
            exit
            ;;
        esac
      fi
      echo "Generating ssh key at $KeyLocation."
      ssh-keygen -t rsa -b 4096 -C "$UserName@$HostName" -N "" -f "$KeyLocation"
      echo "Here's your SSH public key:"
      cat "$KeyLocation.pub"
      ;;
    (g)
      echo "Warning: Does not currently check if you already have a key"
      KeyScript=$(mktemp)
      echo "
      %echo Generating gpg key
      Key-Type: RSA
      Key-Length: 4096
      Subkey-Type: RSA
      Subkey-Length: 4096
      Name-Real: $UserFullName
      Name-Comment: $HostName
      Name-Email: $UserEmail
      Expire-Date: 0
      %commit
      %echo Done.
      " >"$KeyScript"
      gpg --batch --gen-key "$KeyScript"
      rm -f "$KeyScript"
      ;;
    (u)
      echo -e "
      Username (\$USER):\\t\\t$UserName
      User Name (git config or chfn):\\t$UserFullName
      User Email (git config):\\t$UserEmail
      Hostname (\$HOSTNAME):\\t\\t$HostName
      "
      ;;
    (\? | h)
      PrintHelp && exit
      ;;
  esac
done
