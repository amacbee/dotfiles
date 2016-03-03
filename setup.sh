#!/bin/sh
# -*- coding: utf-8 -*-
# refer to "http://fixture.jp/blog/2012/02/how-to-manage-dotfiles-on-github/"

export OH_MY_ZSH="${HOME}/.oh-my-zsh"
if [ ! -d "${OH_MY_ZSH}"; ] then
   sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
fi

cd $(dirname $0)
for dotfile in .?*
do
    if [ $dotfile != '..' ] && [ $dotfile != '.git' ]
    then
        ln -Fis "$PWD/$dotfile" $HOME
    fi
done
