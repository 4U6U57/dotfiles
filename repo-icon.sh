#!/bin/bash

##
# @file repo-icon.sh
# @brief Generates custom repo icon.png files from user's ~/.face
# @author August Valera
# @version
# @date 2017-11-18
#
# Usage: repo-icon TEXT [input.png]

# Get arguments
echo $(basename $0)
Text=$(echo $1 | tr [a-z] [A-Z])
[[ -z $1 ]] && echo "Error: no TEXT argument given" >&2 && exit
Image=~/.face
[[ ! -z $2 ]] && Image=$2
[[ ! -e $Image ]] && echo "Error: image does not exist: $Image" >&2 && exit
TextLen=$(echo $Text | wc -c)
Output=icon.png

# Check dependency
if ! command -v convert >/dev/null; then
  echo "Error: dependency imagemagick not installed" >&2
  sudo apt install imagemagick -y
fi
! command -v convert >/dev/null && exit

#convert $Image -fill '#FF4500' -draw \
  #  "rectangle 0,150,$((10 + $((50 * TextLen)))),70" -fill white \
  #  -stroke white -strokewidth 2 -pointsize 70 -annotate +30+135 "$Text" icon.png

convert $Image \( -background '#FF4500' -bordercolor '#FF4500' -border 15\
  -fill white -stroke white -strokewidth 3 -pointsize 70 label:"$Text" \)\
  -gravity west -compose over -composite $Output
echo done
