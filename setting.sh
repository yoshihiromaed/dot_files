#!/bin/bash
if [ ! -d ~/.vim/bundle ] ; then
	mkdir -p ~/.vim/bundle
fi
if [ ! -d ~/.vim/bundle/neobundle.vim ] ; then
	git clone https://github.com/Shougo/neobundle.vim.git ~/.vim/bundle/neobundle.vim
fi

ln -s -f ~/dot_files/vimrc ~/.vimrc
ln -s -f ~/dot_files/screenrc ~/.screenrc
ln -s -f ~/dot_files/tmux.conf ~/.tmux.conf
echo "[ -f ${HOME}/dot_files/zshrc ] && source ${HOME}/dot_files/zshrc" >> ~/.zshrc
echo "[ -f ${HOME}/dot_files/zlogin ] && source ${HOME}/dot_files/zlogin" >> ~/.zlogin
