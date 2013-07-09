source ~/dotfiles/antigen/antigen.zsh

antigen use oh-my-zsh

antigen bundle git
antigen bundle heroku
antigen bundle npm
antigen bundle command-not-found

antigen bundle zsh-users/zsh-syntax-highlighting

antigen theme agnoster

antigen apply