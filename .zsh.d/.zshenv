# -*- mode: shell-script -*-

# LANG
export LANG=ja_JP.UTF-8


# exports
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:"/usr/local/lib"
export PATH=$PATH:"/usr/local/bin"
export PATH=$PATH:"/usr/texbin"                             # TeX
export PATH="/usr/local/heroku/bin:$PATH"                   # heroku
export PATH="$HOME/.rbenv/bin:$PATH"                        # Ruby
eval "$(rbenv init -)"


# autoloads
fpath=(~/.zsh.d/plugins/*(N-/) $fpath)
autoload -Uz add-zsh-hook
autoload -U colors
colors
autoload -U compinit
compinit


# コマンドの実行終了通知
autoload -Uz notify.plugin
export SYS_NOTIFIER="/usr/local/bin/terminal-notifier"
export NOTIFY_COMMAND_COMPLETE_TIMEOUT=10
