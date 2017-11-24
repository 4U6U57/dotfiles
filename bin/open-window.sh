#!/bin/bash

##
# @file open-window.sh
# @brief Opens files on Windows Subsystem for Linux with default Windows applications
# @author August Valera
#
# @version
# @date 2017-11-23
#

Exe=$(basename $0 .sh)

# Error function
Error() {
  echo "$Exe: ERROR: $@" >&2
  exit 1
}
Warning() {
  echo "$Exe: WARNING: $@" >&2
}

# Find windows path
WinPath=""
ConfigFile=~/.$Exe
if [[ -e $ConfigFile ]]; then
  source $ConfigFile
else
  echo "Creating configuration file: $ConfigFile"
  touch $ConfigFile
fi

if [[ -z $WinHome ]]; then
  # Iterate through disks
  WinDisk=""
  for Disk in /mnt/*; do
    [[ -e $Disk/Windows ]] && WinDisk=$Disk && break
  done
  [[ -z $WinDisk ]] && Error "Could not detect Windows disk"
  echo "Select your Windows home folder:"
  select WinHome in $WinDisk/Users/*; do break; done
  [[ -z $WinHome ]] && Error "Could not find Windows home folder"
  echo "WinHome=$WinHome" >> $ConfigFile
fi

# Open file
File=$1
if [[ ! -z $File ]]; then
  # Check file existence
  [[ ! -e $File ]] && Error "File does not exist: $File"

  # Move file to Windows partition, if necessary
  FilePath=$(readlink -f $File)
  if [[ $FilePath != $WinHome/* ]]; then
    Warning "File not in Windows partition: $FilePath"
    TempFolder=$WinHome/$Exe
    [[ ! -e $TempFolder ]] && echo "Creating temporary folder: $TempFolder" && mkdir $TempFolder
    FilePath=$TempFolder/$(basename $File)
    cp -v $File $FilePath
  fi

  FileWin=$(echo $FilePath | cut -d "/" -f 3-)
  FileWin="$(tr '[a-z]' '[A-Z]' <<< ${FileWin:0:1}):/${FileWin:1}"
  FileWin="$(tr '/' '\\' <<< $FileWin)"
  echo "FileWin=$FileWin"

  # Open the file with windows
  cmd.exe /C start "$FileWin"

fi
