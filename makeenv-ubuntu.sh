#!/bin/sh -x

sudo apt-get install -y vim screen git gcc


cp ./vimrc ~/.vimrc
mkdir -p ~/.vim/bundle
git clone https://github.com/Shougo/neobundle.vim.git ~/.vim/bundle/neobundle.vim
git clone https://github.com/Shougo/vimproc.vim.git ~/.vim/bundle/vimproc
(cd ~/.vim/bundle/vimproc; make)

mkdir -p ~/.vim/swap
mkdir -p ~/.vim/cache
mkdir -p ~/.vim/backup

cp ./screenrc ~/.screenrc
