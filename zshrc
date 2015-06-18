export EDITOR=nvim
export KEYTIMEOUT=10

bindkey -v

# Escape with jj
bindkey -M viins ‘jj’ vi-cmd-mode
bindkey '^[[1;9C' forward-word
bindkey '^[[1;9D' backward-word

# Go!
export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin

# Homebrew and home bin
export PATH=$PATH:/usr/local/bin:$HOME/bin

# Use ~~ as the trigger sequence instead of the default **
export FZF_COMPLETION_TRIGGER='~~'

# Options to fzf command
export FZF_DEFAULT_OPTS='-x'

# Aliases

alias cd=pushd
alias vi=nvim
alias vim=nvim

# Add the file to the current vim server.
vis() {
  nvim --servername ${2:=VIM} --remote $1
}

alias notify='terminal-notifier -sound default -message'

# Make git autocomlete un-useless.
__git_files () {
    _wanted files expl 'local files' _files
}

title() {
    echo -ne "\e]1;$1\a"
}

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Sources
source ~/dotfiles/ck_helpers
source ~/.fzf.zsh
