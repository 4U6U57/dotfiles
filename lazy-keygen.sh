#!/bin/bash

UserName=$USER
UserFullName=$(git config --get user.name)
[[ -z $UserFullName ]] && UserFullName=$(getent passwd $Username | cut -d ':' -f 5 | cut -d ',' -f 1)
UserEmail=$(git config --get user.email)
HostName=$HOSTNAME

while getopts "sguh" opt; do
  case $opt in
    (s)
      KeyLocation=~/.ssh/id_rsa
      if [[ -e $KeyLocation ]]; then
        echo "There is already a key at $KeyLocation."
        echo -n "(D)elete it and regenerate, (S)elect other location, or (C)ancel: "
        read $Input -t 10
        case $Input in
          (D|d)
            echo "Deleting $KeyLocation and regenerating."
            ;;
          (S|s)
            echo -n "Enter in the new key location: "
            read $KeyLocation -t 60
            [[ -z $KeyLocation ]] && "You did not enter in a location, quitting." && exit
            ;;
          (*)
            echo "Okay, quitting."
            exit
            ;;
        esac
      fi
      echo "Generating ssh key at $KeyLocation."
      ssh-keygen -t rsa -b 4096 -C "$UserName@$HostName" -N "" -f $DefaultKeyLocation
      ;;
    (g)
      echo "Warning: Does not currently check if you already have a key"
      KeyScript=$(mktemp)
      echo "%echo Generating gpg key" >>$KeyScript
      echo "Key-Type: RSA" >>$KeyScript
      echo "Key-Length: 4096" >>$KeyScript
      echo "Subkey-Type: RSA" >>$KeyScript
      echo "Subkey-Length: 4096" >>$KeyScript
      echo "Name-Real: $UserFullName" >>$KeyScript
      echo "Name-Comment: $HostName" >>$KeyScript
      echo "Name-Email: $UserEmail"
      echo "Expire-Date: 0" >>$KeyScript
      echo "%commit" >>$KeyScript
      echo "%echo Done." >>$KeyScript
      gpg --batch --gen-key $KeyScript
      rm -f $KeyScript
      ;;
    (u)
      echo -e "Username (\$USER):\t\t$UserName"
      echo -e "User Name (git config or chfn):\t$UserFullName"
      echo -e "User Email (git config):\t$UserEmail"
      echo -e "Hostname (\$HOSTNAME):\t\t$HostName"
      ;;
    (\? | h)
      echo "$(basename $0): Key generator for lazy"
      echo
      echo -e "\t-s\tGenerate SSH key with ssh-keygen"
      echo -e "\t-g\tGenerate GPG key with gpg --gen-key"
      echo -e "\t-u\tPrints out generated user info that would be used"
      echo -e "\t-h\tHelp, prints this message"
      exit
      ;;
  esac
done
