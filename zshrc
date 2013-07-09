source ~/dotfiles/antigen/antigen.zsh

antigen use oh-my-zsh

antigen bundle git
antigen bundle heroku
antigen bundle npm
antigen bundle command-not-found

antigen bundle zsh-users/zsh-syntax-highlighting

antigen theme miloshadzic

antigen apply

bindkey -e
bindkey '^[[C' forward-word
bindkey '^[[D' backward-word

export PATH=/usr/local/share/npm/bin:$PATH