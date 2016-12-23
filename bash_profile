case $HOSTNAME in
  (VALERAPCWK) PS1_color=36;;
  (unix*.lt.ucsc.edu) PS1_color=33;;
  (default) PS1_color=00;;
esac
PS1_str="${debian_chroot:+($debian_chroot)}"
PS1_str="$PS1_str[\[\033[01;"$PS1_color"m\]\u@\h.nsa.gov\[\033[00m\]"
PS1_str="$PS1_str \[\033[01;34m\]\W\[\033[00m\]]\$ "
export PS1=$PS1_str

PATH=$PATH:~/bin
PATH=$PATH:.

export VISUAL="vim"
export EDITOR="vim"

alias less="less --RAW-CONTROL-CHARS"
alias ls="ls --color=auto"
