#!/bin/bash

column -t -s$'\t' -n "$@" | less
