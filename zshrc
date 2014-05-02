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

antigen bundle colored-man
antigen bundle dircycle
antigen bundle golang
antigen bundle vundle

antigen bundle zsh-users/zsh-syntax-highlighting
# antigen bundle tarruda/zsh-autosuggestions



antigen theme sunrise

antigen apply

bindkey -e

unsetopt nomatch

# promptline vim
# [ -f ~/.shell_prompt.sh ] && source ~/.shell_prompt.sh

export PATH=/usr/local/share/npm/bin:/usr/local/bin:$HOME/.cabal/bin:$PATH
# PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting

alias tsync="rsync -W -P -r evan@10.0.0.16:/media/tb/transmission/What_nAAC ~/Music/iTunes/iTunes\ Media/What_nAAC"

encfile() {
  openssl des3 -salt -in $1 -out $2
}
alias encfile=encfile
decfile() {
  openssl des3 -d -salt -in $1 -out $2
}
alias decfile=decfile

autoload zmv

# # Enable autosuggestions automatically
# zle-line-init() {
#     zle autosuggest-start
# }
# zle -N zle-line-init
#
# # use ctrl+t to toggle autosuggestions(hopefully this wont be needed as
# # zsh-autosuggestions is designed to be unobtrusive)
# bindkey '^T' autosuggest-toggle
# # Accept suggestions without leaving insert mode
# bindkey '^f' vi-forward-word
# # or
# bindkey '^f' vi-forward-blank-word
