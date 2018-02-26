# dotfiles

[![Join the chat at https://gitter.im/4U6U57/dotfiles](https://badges.gitter.im/4U6U57/dotfiles.svg)](https://gitter.im/4U6U57/dotfiles)
[![pipeline
status](https://gitlab.com/4U6U57/dotfiles/badges/master/pipeline.svg)](https://gitlab.com/4U6U57/dotfiles/commits/master)
[![npm
version](https://img.shields.io/npm/v/@4U6U57/dotfiles.svg)](http://npmjs.com/package/@4U6U57/dotfiles)


My personal preference files "dotfiles" for Linux. Feel free to look around, and
fork it if you want.

## Installation

### vimrc

The [vimrc] file is my configuration file for the *Vim* text editor, adding a
bunch of functionality and making vim look a lot nicer by importing a variety
of open source plugins. The current state of the repo is exactly how I have my
editor configured on all my devices.

The [vimrc] configuration can be installed as a standalone project with the
following command (requires `curl`):

```bash
curl -fLo ~/.vimrc --create-dirs https://raw.githubusercontent.com/4U6U57/dotfiles/master/vimrc
```

Updating vimrc is done with the vim command `:VimrcUpdate` or by pressing `F12`
in Normal mode. More information can be found by opening the [vimrc] file and
reading the comments.

### Full Installation

Full installation of this repository as is is **NOT RECOMMENDED** for most, if
not all, users. This repo includes the [dotbot] installer as a submodule, so
installation is relatively painless and non-destructive, requiring only one
command and only exporting files that do not currently exist in your system.
However, this installs *everything* in my dotfiles repo, and most of the stuff
here will probably not interest you. It is better to view the contents of the
repo (either through the GitHub website, or by cloning it) and then making
appropriate changes to your own setup.

If you would still like to install the whole shebang (which I highly suggest
against), you can do so by running:

```bash
git clone https://gitlab.com/4U6U57/dotfiles ~/bin/dotfiles && ~/bin/dotfiles/install
```

Better yet, I highly recommend checking out *[dotbot]* and either forking the
[dotfiles-template](https://github.com/anishathalye/dotfiles_template) repo or
using the [init-dotfiles](https://github.com/Vaelatern/init-dotfiles) script to
import your existing dotfiles, and create your own *[dotbot]* powered *dotfiles*
repo.

## Libraries/Standards Used

- [dotbot]: Dotfile installer
- [editorconfig](https://editorconfig.org): Text editor preferences
- [junegunn/vim-plug](https://github.com/junegunn/vim-plug): Vim plugin manager
  - Various other Vim plugins, listed in detail in the [vimrc] file

## Feedback and Other Questions

I am always looking for ways to streamline my process and make my config even
better. Free free to drop by our Gitter chat room (linked above) for any
questions/suggestions. You can also post a GitHub issue for specific bugs.

[dotbot]: https://github.com/anishathalye/dotbot
[vimrc]: vimrc
