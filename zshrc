#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#
alias vim='mvim -v'
export EDITOR=vim

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Misc

# Open the file in a given macvim server.
vis() {
  mvim --servername ${2:=VIM} --remote $1
}
alias tmush='ssh rsyncadmin@192.168.56.10 -t "tmux -CC"'
alias notify='terminal-notifier -sound default -message'
# alias vim="mvim -v"

bindkey -v
export KEYTIMEOUT=1

# codebase
alias makeemailswork='sh cli/debug/make_emails_work.sh'
alias unmemcache='nc localhost 11100 <<< "flush_all" && nc localhost 11101 <<< "flush_all"'

# Additional

# Make git autocomlete un-useless.
__git_files () {
    _wanted files expl 'local files' _files
}
source ~/.fzf.zsh

# User specific aliases and functions
alias taillog='tail -f /var/www/git-repos/pm/logs/application/webapp.log'
alias cd=pushd
# alias tmux="TERM=screen-256color-bce tmux"

PATH=$PATH:/usr/local/bin
