# -*- mode: shell-script -*-


# autoloads
fpath=(~/.zsh.d/plugins/*(N-/) $fpath)    # .zsh.d/plugin以下をfpath指定
autoload -Uz add-zsh-hook
autoload -U colors                        # fgによるカラー指定
colors
autoload -U compinit                      # 補完機能の強化
compinit


# コマンドの実行終了通知
autoload -Uz notify.plugin
export SYS_NOTIFIER="/usr/local/bin/terminal-notifier"
export NOTIFY_COMMAND_COMPLETE_TIMEOUT=10


# .bashrcの設定を読み込み
if [  -d ~/.bashrc ] ; then
  source ~/.bashrc
fi

# alias
alias ls='ls -FlhG'
alias sort="LC_ALL='C' sort"
alias uniq="LC_ALL='C' uniq"


# options


setopt print_eight_bit        # 日本語補完時の文字化けに対応
setopt auto_cd                # cd入力の省略
setopt auto_menu              # TABで補完候補を切り替え
setopt auto_list              # 補完候補を一覧で表示
setopt auto_param_slash       # 補完候補がディレクトリの場合, 末尾に / を追加
setopt auto_param_keys        # カッコの対応も補完
setopt correct                # コマンドのスペル訂正
setopt list_packed            # 補完候補をできるだけ詰めて表示
setopt list_types             # 補完候補のファイル種別を識別
unsetopt list_beep            # 補完の beep を無効化
setopt rec_exact              # 曖昧補完を有効化
setopt interactive_comments   # コマンドでも # 以降をコメントとみなす
setopt magic_equal_subst      # = 以降も補完(--prefix= 等)
setopt complete_in_word       # コマンドの途中でもカーソル位置で補完
setopt always_last_prompt     # カーソル位置を保持してファイル名一覧を補完)
setopt no_beep                # beepを無効化


# Emacs key binding
bindkey -e


# 補完
## LSCOLORS
# 本来なら LSCOLORS は別途設定すべきかもしれないが, 補完の表示に使用した
# いのでここで設定することに.
export LSCOLORS=exgxfxdxcxdxdxbxadacec
export LS_COLORS='rs=0:di=01;34:ln=01;36:mh=00:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:su=37;41:sg=30;43:ca=30;41:tw=30;42:ow=34;42:st=37;44:ex=01;32:*.tar=01;31:*.tgz=01;31:*.arj=01;31:*.taz=01;31:*.lzh=01;31:*.lzma=01;31:*.tlz=01;31:*.txz=01;31:*.zip=01;31:*.z=01;31:*.Z=01;31:*.dz=01;31:*.gz=01;31:*.lz=01;31:*.xz=01;31:*.bz2=01;31:*.bz=01;31:*.tbz=01;31:*.tbz2=01;31:*.tz=01;31:*.deb=01;31:*.rpm=01;31:*.jar=01;31:*.war=01;31:*.ear=01;31:*.sar=01;31:*.rar=01;31:*.ace=01;31:*.zoo=01;31:*.cpio=01;31:*.7z=01;31:*.rz=01;31:*.jpg=01;35:*.jpeg=01;35:*.gif=01;35:*.bmp=01;35:*.pbm=01;35:*.pgm=01;35:*.ppm=01;35:*.tga=01;35:*.xbm=01;35:*.xpm=01;35:*.tif=01;35:*.tiff=01;35:*.png=01;35:*.svg=01;35:*.svgz=01;35:*.mng=01;35:*.pcx=01;35:*.mov=01;35:*.mpg=01;35:*.mpeg=01;35:*.m2v=01;35:*.mkv=01;35:*.webm=01;35:*.ogm=01;35:*.mp4=01;35:*.m4v=01;35:*.mp4v=01;35:*.vob=01;35:*.qt=01;35:*.nuv=01;35:*.wmv=01;35:*.asf=01;35:*.rm=01;35:*.rmvb=01;35:*.flc=01;35:*.avi=01;35:*.fli=01;35:*.flv=01;35:*.gl=01;35:*.dl=01;35:*.xcf=01;35:*.xwd=01;35:*.yuv=01;35:*.cgm=01;35:*.emf=01;35:*.axv=01;35:*.anx=01;35:*.ogv=01;35:*.ogx=01;35:*.aac=00;36:*.au=00;36:*.flac=00;36:*.mid=00;36:*.midi=00;36:*.mka=00;36:*.mp3=00;36:*.mpc=00;36:*.ogg=00;36:*.ra=00;36:*.wav=00;36:*.axa=00;36:*.oga=00;36:*.spx=00;36:*.xspf=00;36:';
export ZLS_COLORS=$LS_COLORS
export CLICOLOR=true
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}  # 色指定に LS_COLORS を使用
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'    # ディレクトリ名の補完
zstyle ':completion:*' menu select=2                   # カーソルによる補完候補の選択を有効化
zstyle ':completion:*' remote-access true              # リモートディレクトリも補完


# history
setopt hist_ignore_all_dups  # 重複ヒストリは古い方を削除
setopt inc_append_history    # 履歴を直ぐに反映
setopt share_history         # ヒストリの共有 for tmux
setopt hist_ignore_space     # コマンド行先頭が空白の時登録しない
setopt hist_reduce_blanks    # 余分なスペースを削除
setopt hist_no_store         # historyコマンドは登録しない
HISTFILE=~/.zsh_history
HISTSIZE=100000
SAVEHIST=100000

### Ctr-p/Ctrl-n をhistoryに利用
my_bindkey() {
  autoload -U $2
  zle -N $2
  bindkey $1 $2
}
my_bindkey '^P' up-line-or-beginning-search
my_bindkey '^N' down-line-or-beginning-search


# Git setting
### Gitを利用する際にはhistoryを使わない
compdef -d git

### vcs_infoでVCSの情報を取得
autoload -Uz vcs_info

### 表示フォーマットの指定
### %b ブランチ情報
### %a アクション名(mergeなど)
zstyle ':vcs_info:*' formats '[%b]'
zstyle ':vcs_info:*' actionformats '[%b|%a]'
precmd () {
    psvar=()
    LANG=en_US.UTF-8 vcs_info
    [[ -n "$vcs_info_msg_0_" ]] && psvar[1]="$vcs_info_msg_0_"
}

### バージョン管理されているディレクトリにいれば表示，そうでなければ非表示
RPROMPT="%1(v|%F{red}%1v%f|)"


# Prompt Color
my_user_color=green
my_host_color=green
my_dir_color=yellow

PROMPT="\
%{$fg[$my_user_color]%}\
%n\
%{$reset_color%}\
@\
%{$fg_bold[$my_host_color]%}\
%m\
%{$reset_color%}\
%{$fg_bold[$my_dir_color]%}\
 %~\
%{$fg_bold[$my_dir_color]%}\
 %# \
%{$reset_color%}"
