export SHELL=/bin/bash
export TERM=xterm-256color
export GPG_TTY=$(tty)

export PS1='\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
export LESS="-asrRix4"
export PATH=$HOME/go/bin:$HOME/.local/bin:$PATH

alias ls='ls --color=tty'
alias ll='ls -lh'
alias grep='grep --color=tty'

echo '$ stty -a'
stty -a
