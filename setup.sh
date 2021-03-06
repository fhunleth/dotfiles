#!/bin/bash

UNAME=$(uname)

if false; then
    # Undebugged stuff from OSX setup

    # Install Powerline and fonts
    # You still need to change the default font on your terminal
    # to be one of the Powerline fonts (e.g. Mesio LG S for Powerline)

    brew install python
    pip2 install --user powerline-status
    git clone https://github.com/powerline/fonts.git
    cd fonts/
    ./install.sh
    cd ..
    rm -fr fonts

    mkdir -p ~/.local/bin
    git clone https://github.com/powerline/powerline.git
    cp powerline/scripts/* ~/.local/bin

    # Install zsh
    sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
fi

# vim
echo "Setting up .vimrc..."
ln -sf `pwd`/vim/vimrc ~/.vimrc
mkdir -p ~/.vim/ftplugin
ln -sf `pwd`/vim/ftplugin/ruby.vim ~/.vim/ftplugin/ruby.vim
ln -sf `pwd`/vim/ftplugin/erlang.vim ~/.vim/ftplugin/erlang.vim
if [ ! -d ~/.vim/bundle/Vundle.vim ]; then
    mkdir -p ~/.vim/bundle
    git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
fi
mkdir -p ~/.vim/colors
curl -o ~/.vim/colors/molokai.vim https://raw.githubusercontent.com/tomasr/molokai/master/colors/molokai.vim
vim +PluginInstall +qall

# bash
#mkdir -p ~/.bash_files
#ln -sf `pwd`/bash/aliases ~/.bash_files/aliases
#ln -sf `pwd`/bash/prompts ~/.bash_files/prompts

# ack
#ln -sf `pwd`/ack/ackrc ~/.ackrc

# map caps to esc
echo "Mapping caps lock to escape..."
if [ "$UNAME" = "Darwin" ]; then
    echo "To map caps lock to escape, go to Preferences->Keyboard->Modifiers"
else
    ln -sf `pwd`/xmodmap/xmodmap-esc ~/.xmodmap-esc
fi

# tmux
#ln -sf `pwd`/tmux/tmux.conf ~/.tmux.conf
#ln -sf `pwd`/tmux/teamocil ~/.teamocil

# synergy
#ln -sf `pwd`/synergy/synergy.conf ~/.synergy.conf

# bins
#ln -sf `pwd`/bin/tspace ~/bin/tspace
#ln -sf `pwd`/bin/list-terminal-colors ~/bin/list-terminal-colors

# vscode
echo "Setting up Visual Studio Code..."
if [ "$UNAME" = "Darwin" ]; then
    VSCODE_USER="$HOME/Library/Application Support/Code/User"
else
    VSCODE_USER="$HOME/.config/Code/User"
fi
mkdir -p "$VSCODE_USER"
ln -sf `pwd`/vscode/settings.json "$VSCODE_USER/settings.json"
ln -sf `pwd`/vscode/keybindings.json "$VSCODE_USER/keybindings.json"
