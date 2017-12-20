#!/bin/bash

zerotier-setup() {
if [[ $(uname -r) == Microsoft ]]; then
  true # Don't install on WSL
elif dpkg -s zerotier-one &>/dev/null; then
  true # Already installed
else
  curl -s 'https://pgp.mit.edu/pks/lookup?op=get&search=0x1657198823E52A61' | gpg --import
  if z=$(curl -s 'https://install.zerotier.com/' | gpg); then
    echo "$z" | sudo bash
  fi
fi
}
zerotier-setup
