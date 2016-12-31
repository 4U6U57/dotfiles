case $HOSTNAME in
  (unix*.lt.ucsc.edu)
    PS1_color=33;; # Yellow
  (VALERAPCWK)
    PS1_color=35;; # Magenta
  (YOLOSWAG)
    PS1_color=34;; # Blue
  (YOLOSWAGGER)
    PS1_color=36;; # Cyan
  (default)
    PS1_color=00;; # Default
esac
PS1_str="${debian_chroot:+($debian_chroot)}"
PS1_str="$PS1_str[\[\033[01;"$PS1_color"m\]\u@\h.nsa.gov\[\033[00m\]"
PS1_str="$PS1_str \[\033[01;34m\]\W\[\033[00m\]]\$ "
export PS1=$PS1_str

export PATH="$PATH:$HOME/bin"
export PATH="$PATH:."
export PATH="$PATH:$HOME/sbin"

export VISUAL="vim"
export EDITOR="vim"

alias less="less --RAW-CONTROL-CHARS"
alias ls="ls --color=auto"

# Ruby for Jekyll
if [[ $HOSTNAME == "YOLOSWAG" ]]; then
  export PATH="$HOME/.rbenv/bin:$PATH"
  eval "$(rbenv init -)"
  export PATH="$HOME/.rbenv/plugins/ruby-build/bin:$PATH"
fi
