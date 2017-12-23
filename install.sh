#!/usr/bin/env bash
# install: part of the 4U6U57/dotfiles project
# INSTALL: Run this script to install this repo
# Installer script for the dotfiles repo, calls the dotbot utility
# Based off of anishathalye/dotbot

set -e

CONFIG="install.conf.yaml"
BASE_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
DOTBOT_DIR="dotbot"
DOTBOT_BIN="bin/dotbot"
DOTBOT_EXE="${BASE_DIR}/${DOTBOT_DIR}/${DOTBOT_BIN}"
PLUGIN_DIR="${BASE_DIR}/plugins/*"

cd "${BASE_DIR}"
git pull origin master
git submodule update --init --recursive "${DOTBOT_DIR}"

dotbot_install() {
  INSTALL_DIR="$1"
  shift
  CONFIG_FILE="${INSTALL_DIR}/${CONFIG}"
  if [[ -e "${CONFIG_FILE}" ]]; then
    "${DOTBOT_EXE}" \
      --base-directory "${INSTALL_DIR}" \
      --config-file "${CONFIG_FILE}" \
      --plugin-dir "${PLUGIN_DIR}" \
      "${@}"
  fi
}

dotbot_install "${BASE_DIR}"
dotbot_install "${BASE_DIR}/private"
