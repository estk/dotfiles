export EDITOR=nvim
export KEYTIMEOUT=10

bindkey -v

# Escape with jj
bindkey -M viins ‘jj’ vi-cmd-mode
bindkey '^[[1;9C' forward-word
bindkey '^[[1;9D' backward-word

# Defaults
export BROWSER="firefox"                # Set Firefox as the default browser.
export EDITOR="nvim"                    # Set Neovim as the default editor.

# Go!
export GOPATH=$HOME/golang
export PATH=$PATH:$GOPATH/bin

# Homebrew and home bin
export PATH=$PATH:/usr/local/bin:$HOME/bin

#
export FZF_DEFAULT_COMMAND='ag --ignore .git -g ""'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

# To apply the command to CTRL-T as well
# Use ~~ as the trigger sequence instead of the default **
export FZF_COMPLETION_TRIGGER='~~'

# Options to fzf command
export FZF_DEFAULT_OPTS='-x'
#
# fzf command
# export FZF_DEFAULT_COMMAND='git ls-tree -r --name-only HEAD || ag -l -g ""'


# Aliases
# Add the file to the current vim server.
function vis {
  nvim --servername ${2:=VIM} --remote $1
}
# Replace with ag
function rag {
  ag --print0 -l $1 | xargs -0 perl -pi -e "s/$1/$2/g"
}
function listening {
    lsof -i -n -P | grep LISTEN
}

alias notify='terminal-notifier -sound default -message'

alias cs="cd ~/repos/cs"

# Miscellaneous settings.
setopt appendhistory                    # Append history instead of replacing.
setopt autocd                           # If the given command is a directory
                                        # switch to it.
setopt beep                             # Beep when a history entry isn't there.
setopt extendedglob                     # Treat #, ~, and, ^ characters as part
                                        # of the patterns for filename gen.
setopt nomatch                          # Print an error when the filename
                                        # pattern has no match.
setopt notify                           # Report job status.

# =============================================================================
# Aliases
# =============================================================================
alias cd=pushd
alias v=nvim
alias vi=nvim
alias vim=nvim

alias m='make -j'

alias cp="nocorrect cp -v"              # Verbose copying with no auto-correct.
alias df="df -h"                        # Enable human-readable output.
alias du='ncdu'                         # Use the Ncdu tool instead of du.
alias grep="grep -n --color"            # Show color and line numbers for match.
alias ht="htop -u $(whoami)"            # Show only my processes.

alias mkdir='nocorrect mkdir'           # No auto-correct when making directory.
alias mv="nocorrect mv -v"              # Verbose moving with no auto-correct.
alias netstat="netstat -nap"            # List all network connections.
alias pgrep="pgrep -l"                  # List processes by both name and id.
alias rm="nocorrect rm -v"              # Verbose removing with no auto-correct.

# Update fzf and prezto to their latest versions.
alias updates="cd ~/.fzf && git pull && \
    git submodule update --init --recursive && \
    cd ~/.zprezto && git pull && \
    git submodule update --init --recursive && cd ~"
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
alias repos='cd ~/repos'
alias cinf='cd $GOPATH/src/stash.corp.creditkarma.com/cinf'
