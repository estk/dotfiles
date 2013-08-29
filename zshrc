source ~/dotfiles/antigen/antigen.zsh

antigen use oh-my-zsh

antigen bundle git
antigen bundle github
antigen bundle git-flow
antigen bundle cabal
antigen bundle brew
antigen bundle osx
antigen bundle heroku
antigen bundle node
antigen bundle npm
antigen bundle rsync
antigen bundle command-not-found

antigen bundle zsh-users/zsh-syntax-highlighting

antigen theme sunrise

antigen apply

bindkey -e

unsetopt nomatch

export PATH=/usr/local/share/npm/bin:/usr/local/bin:$PATH
PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
