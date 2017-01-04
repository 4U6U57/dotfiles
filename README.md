# dotfiles

[![Join the chat at https://gitter.im/4U6U57/dotfiles](https://img.shields.io/gitter/room/4U6U57/dotfiles.svg)](https://gitter.im/4U6U57/dotfiles?utm_source=badge&utm_medium=badge&utm_campaign=pr-badge&utm_content=badge)
[![Huboard Scrum Board](https://img.shields.io/github/issues/4U6U57/dotfiles.svg?label=Huboard)](https://huboard.com/4U6U57/dotfiles)

My personal preference files "dotfiles" for Linux. Feel free to look
around, and fork it if you want.

## Installation

This repo includes the [dotbot](https://github.com/anishathalye/dotbot)
installer as a submodule, so all you need to do install is run the
following:

```bash
git clone https://github.com/4U6U57/dotfiles && dotfiles/install
```

## vimrc

The [vimrc](vimrc) file is my configuration file for the *Vim* text
editor, and can be installed independently of this repo with the
following command:

```bash
curl -fLo ~/.vimrc --create-dirs \
  https://raw.githubusercontent.com/4U6U57/dotfiles/master/vimrc
```

It can then be updated with the command `:VimrcUpdate` or by pressing
`F12`. More information can be found by opening the file and reading the
comments.
