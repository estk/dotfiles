#!/bin/bash
############################
# .make.sh
# This script creates symlinks from the home directory to any desired dotfiles in ~/dotfiles
############################
# Install zprezto
shopt -s extglob

function install_zsh {
# Test to see if zshell is installed.  If it is:
if [ -f /bin/zsh -o -f /usr/bin/zsh -o -f /usr/local/bin/zsh ]; then
    # Clone my zprezto repository from GitHub only if it isn't already present
    if [[ ! -d $HOME/.zprezto ]]; then
        git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"
        for rcfile in "${ZDOTDIR:-$HOME}"/.zprezto/runcoms/*; do
          ln -s "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"
        done
    fi


    # Set the default shell to zsh if it isn't currently set to zsh
    if [[ ! $(echo $SHELL) == $(which zsh) ]]; then
        chsh -s $(which zsh)
    fi

    ln -s ./zpreztorc $HOME/.zpreztorc
else
    # If zsh isn't installed, get the platform of the current machine
    platform=$(uname);
    # If the platform is Linux, try an apt-get to install zsh and then recurse
    if [[ $platform == 'Linux' ]]; then
        sudo apt-get install zsh
        install_zsh
    # If the platform is OS X, tell the user to install zsh :)
    elif [[ $platform == 'Darwin' ]]; then
        echo "Please install zsh, then re-run this script!"
        exit
    fi
fi
}

install_zsh

########## Variables

dir=~/dotfiles                    # dotfiles directory
olddir=~/dotfiles_old             # old dotfiles backup directory
files="tmux.conf agignore gitconfig vimrc vim zshrc private Xresources editorconfig"    # list of files/folders to symlink in homedir

##########

# create dotfiles_old in homedir
echo -n "Creating $olddir for backup of any existing dotfiles in ~ ..."
mkdir -p $olddir
echo "done"

# change to the dotfiles directory
echo -n "Changing to the $dir directory ..."
cd $dir
echo "done"

# move any existing dotfiles in homedir to dotfiles_old directory, then create symlinks from the homedir to any files in the ~/dotfiles directory specified in $files
echo "Moving any existing dotfiles from ~ to $olddir"
for file in $files; do
    if [ ! -h ~/.$file ]; then
        echo "Moving existing dotfile .$file from ~ to $olddir"
        mv ~/.$file ~/dotfiles_old/$file
    else
        # remove symlink
        rm ~/.$file
    fi
    echo "Creating symlink to $file in home directory."
    ln -s $dir/$file ~/.$file
done

##############
# Neovim links
##############

makelink () {
    file=$1
    link=$2
    # is not symlink?
    if [ ! -h ~/.$link ]; then
        mv ~/.$link ~/dotfiles_old/$link
    else
        # remove symlink
        rm ~/.$link
    fi
    ln -s $dir/"$file" ~/."$link"
    return 0
}
makelink "vim" "nvim"
makelink "vimrc" "nvimrc"
