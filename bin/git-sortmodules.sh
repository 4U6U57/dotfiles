#!/bin/bash

# Sorts the .gitmodules file in the current directory
# Taken from https://gist.github.com/jaytaylor/fad7bc69e5f12fc2331e2c6330bd8419

TempModules=$(mktemp)
awk 'BEGIN { I=0 ; J=0 ; K="" } ; /^\[submodule/{ N+=1 ; J=1 ; K=$2 ; gsub(/("vendor\/|["\]])/, "", K) } ; { print K, N, J, $0 } ; { J+=1 }' .gitmodules \
    | sort \
    | awk '{ $1="" ; $2="" ; $3="" ; print }' \
    | sed 's/^ *//g' \
    | awk '/^\[/{ print ; next } { print "\t", $0 }' \
    >"$TempModules"
mv "$TempModules" .gitmodules
