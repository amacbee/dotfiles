#!/bin/sh
# -*- coding: utf-8 -*-
# refer to "http://fixture.jp/blog/2012/02/how-to-manage-dotfiles-on-github/"

cd $(dirname $0)
for dotfile in .?*
do
    if [ $dotfile != '..' ] && [ $dotfile != '.git' ]
    then
        ln -Fis "$PWD/$dotfile" $HOME
    fi
done
