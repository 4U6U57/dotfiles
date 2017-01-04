# dotfiles

[![Join the chat at https://gitter.im/4U6U57/dotfiles](https://badges.gitter.im/4U6U57/dotfiles.svg)](https://gitter.im/4U6U57/dotfiles?utm_source=badge&utm_medium=badge&utm_campaign=pr-badge&utm_content=badge)
[![Check the scrum board at waffle.io](https://badge.waffle.io/4U6U57/dotfiles.svg?label=ready&title=waffle%20scrum%20board)](http://waffle.io/4U6U57/dotfiles)

My personal preference files "dotfiles" for Linux. Feel free to look
around, and fork it if you want.

## Installation

This repo includes the [dotbot](https://github.com/anishathalye/dotbot)
installer as a submodule, so all you need to do to install it is run the
following, preferrably in your `~/bin/` directory:

```bash
git clone https://github.com/4U6U57/dotfiles && dotfiles/install
```

## vimrc

The [vimrc](vimrc) file is my configuration file for the *Vim* text
editor, and adds a bunch of functionality and makes it look a lot nicer
by importing a variety of open source plugins. The current state of the
repo is exactly how I have my editor configured on all my devices.

The vimrc configuration can be installed independently of this repo with
the following command (requires `curl`):

```bash
curl -fLo ~/.vimrc --create-dirs https://raw.githubusercontent.com/4U6U57/dotfiles/master/vimrc
```

It can then be updated with the command `:VimrcUpdate` or by pressing
`F12`. More information can be found by opening the file and reading the
comments.

## Libraries/Standards Used

- [dotbot](https://github.com/anishathalye/dotbot): Dotfile installer
- [editorconfig](https://editorconfig.org): Text editor preferences
- [junegunn/vim-plug](https://github.com/junegunn/vim-plug): Vim plugin manager
    - Various other Vim plugins, listed in detail in the [vimrc](vimrc) file

## Feedback and Other Questions

I am always looking for ways to streamline my process and make my config
even better. Free free to drop by our Gitter chat room (linked above)
for any questions/suggestions. You can also post a GitHub issue for 
specific bugs.
