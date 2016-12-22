export PS1='${debian_chroot:+($debian_chroot)}[\[\033[01;33m\]\u@\h.nsa.gov\[\033[00m\] \[\033[01;34m\]\W\[\033[00m\]]\$ '

PATH=$PATH:~/bin
PATH=$PATH:.

export VISUAL="vim"
export EDITOR="vim"

alias less="less --RAW-CONTROL-CHARS"
alias ls="ls --color=auto"
