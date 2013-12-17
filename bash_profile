export PATH=/usr/local/bin:$PATH:~/.bin

source ~/.git-completion.bash

alias t='tree -C -a -P "*.clj"'

alias gl='git log --graph --decorate --oneline -10'
alias gs='git status'
alias gd='git diff'

alias cg='git checkout -- ../../../Gemfile.lock'
alias sfr='ENV=development lein do clean, run'

alias vim=/Applications/MacVim.app/Contents/MacOS/Vim

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w \[\033[00;31m\]$(vcprompt)\[\033[00m\]\$ '

alias ls='ls -F'

