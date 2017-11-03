#!/bin/bash
# duck.sh: part of the 4U6U57/dotfiles project
# CNAME updater for the Duck DNS dynamic name server
# TODO: You will most likely not need any of this

quack() {
  token="6843d989-1b7a-47bc-8409-88609ac8d54c" # My token, plz don't steal
  #ipv6=$(ip -6 addr | grep inet6 | awk -F '[ \t]+|/' '{print $3}' | grep -v ^::1 | grep -v ^fe80 | tail -n +2)
  ipv6=$(ip -6 addr | grep inet6 | grep dynamic | awk -F '[ \t]+|/' '{print $3}' | grep -v ^::1 | grep -v ^fe8 | tail -n +1)
  waittime=5

  echo "duck.sh: duckdns updater"
  echo "Host $HOSTNAME has ipv6 addr $ipv6"

  case $HOSTNAME in
    (4U6U57-RPW)
      domains="ucsc";;
    (VALERAPCWK)
      domains="4U6U57";;
    (YOLOSWAGGER)
      domains="YOLOSWAGGER";;
    (4U6U57-RPZ)
      domains="YOLOSWAG";;
    (*)
      domains="";;
  esac

  echo "Updating hosts {$domains}"
  echo

  for domainupper in $domains; do
    echo -n "$domainupper.duckdns.org: "
    domain=${domainupper,,}
    sleep $waittime
    echo url="https://www.duckdns.org/update?domains=$domain&token=$token&ipv6=$ipv6" | curl -k -K -
    echo
  done
}
[[ $USER == "avalera" || $USER == "pi" ]] && quack
