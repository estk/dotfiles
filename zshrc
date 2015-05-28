# vim editor, emacs zle
export EDITOR=nvim
export KEYTIMEOUT=1
bindkey -e

# Be fancy
alias cd=pushd

# Go!
export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin

# Homebrew and home bin
export PATH=$PATH:/usr/local/bin:$HOME/bin


# Aliases

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
