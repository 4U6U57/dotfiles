#!/bin/bash

if ! command -v youtube-dl; then
  echo "youtube-dl not found, try running"
  echo "  sudo -H pip install --upgrade youtube-dl"
  exit 1
fi

youtube-dl --extract-audio --audio-format mp3 --add-metadata --no-mtime "$@"
