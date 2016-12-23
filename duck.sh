#!/bin/bash

token="6843d989-1b7a-47bc-8409-88609ac8d54c"
ipv6=$(ip -6 addr | grep inet6 | awk -F '[ \t]+|/' '{print $3}' | grep -v ^::1 | grep -v ^fe80 | tail -n +2)
waittime=5

echo "duck.sh: duckdns updater"
echo "Host $HOSTNAME has ipv6 addr $ipv6"

case $HOSTNAME in
  (VALERAPCWK)
    domains="4U6U57 unsc";;
  (YOLOSWAGGER)
    domains="YOLOSWAGGER";;
  (YOLOSWAG)
    domains="YOLOSWAG";;
  (default)
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
