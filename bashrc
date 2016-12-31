# Host specific config
PS1_color=0 # Color for PS1
Jekyll=0 # If we need to install Jekyll
CubLinux=0 # If distro is Cub Linux
case $HOSTNAME in
  (unix*.lt.ucsc.edu)
    PS1_color=33 # Yellow
    ;;
  (VALERAPCWK)
    PS1_color=35 #Magenta
    CubLinux=1
    ;;
  (YOLOSWAG)
    PS1_color=34 # Blue
    ;;
  (YOLOSWAGGER)
    PS1_color=36 # Cyan
    CubLinux=1
    ;;
esac

# PS1 terminal prompt
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
if [[ $Jekyll -eq 1 ]]; then
  export PATH="$HOME/.rbenv/bin:$PATH"
  eval "$(rbenv init -)"
  export PATH="$HOME/.rbenv/plugins/ruby-build/bin:$PATH"
fi

# Cub Linux specific
if [[ $CubLinux -eq 1 ]]; then
  # Enable Natural (reversed/macOS style) scrolling on touchpad
  synclient VertScrollDelta=-111 HorizScrollDelta=-111
  # Lower start brightness
  xbacklight -set 10
  # Start slack client
  if which slack >/dev/null 2>&1; then slack --startup; fi
fi
