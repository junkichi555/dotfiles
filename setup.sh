#!/bin/zsh

cp ./.zprofile $HOME/.zprofile
cp ./.zshrc $HOME/.zshrc
cp -r ./.zsh $HOME/.zsh
cp -r ./.config $HOME/.zsh
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $HOME/.zsh/

cp ./.vimrc $HOME/.vimrc
cp -r ./.vim $HOME/.vim
git clone https://github.com/Shougo/neobundle.vim $HOME/.vim/bundle/

cp ./.tmux.conf $HOME/.tmux.conf

cp -r ./bin $HOME/bin
