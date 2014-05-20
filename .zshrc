#zshmisc(1)参照
#   %B %b ボールドにする。終了する。
#   %{...%} エスケープ文字列として読み込む。(あやしげな訳。原文はzshmisc(1)のvisual effectsの段落)
#   %/ 現在のディレクトリ。
#   ${fg[color]}文字色の設定。fgの部分をbgにすると背景色の設定。エスケープシークエンスで設定することもできる。

autoload colors
colors
PROMPT="%B%{${fg[red]}%}%/%%%{${reset_color}%}%b "
PROMPT2="%B%{${fg[red]}%}%_#%{${reset_color}%}%b "
SPROMPT="%B%{${fg[red]}%}%r is correct? [n,y,a,e]:%{${reset_color}%}%b "
[ -n "${REMOTEHOST}${SSH_CONNECTION}" ] &&
    PROMPT="%{${fg[magenta]}%}$(echo ${HOST%%.*} | tr '[a-z]' '[A-Z]') ${PROMPT}"

###############こまごまとした設定###############

#ディレクトリ名を入力するとそのディレクトリに移動
setopt auto_cd

#cd時に-[tab]で過去の移動先を補完
setopt auto_pushd

#typoを修正
setopt correct

#補完候補を詰めて表示する
setopt list_packed

#スラッシュを削除しない
setopt noautoremoveslash

#beepを鳴らさない
setopt nolistbeep
#キーバインド。vi。emacs風にするなら-e
bindkey -v

#エディタ機能を有効にする
autoload zed

##############履歴と補完###############

#コマンド履歴関係のキーマップ
autoload history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "^p" history-beginning-search-backward-end
bindkey "^n" history-beginning-search-forward-end
bindkey "\\ep" history-beginning-search-backward-end
bindkey "\\en" history-beginning-search-forward-end


#履歴の保持数と履歴ファイルの設定
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt hist_ignore_dups     # 同じコマンドを重複して記録しない
setopt share_history        # 履歴の共有


#補完設定ファイルのパスと補完機能の初期化
fpath=(~/.zsh/functions/Completion ${fpath})
autoload -U compinit
compinit

#タブを押さなくても補完候補を表示する
#autoload predict-on
#predict-off


##############エイリアスの設定###############
#OSによる切り替えを行う

setopt complete_aliases     #エイリアスを設定したコマンドでも補完機能を使えるようにする
alias where="command -v"
alias j="jobs -l"

#ls
case "${OSTYPE}" in
freebsd*|darwin*)
    alias ls="ls -G -w"
    ;;
linux*)
    alias ls="ls --color"
    ;;
solaris*)
    alias ls='gls -F --color=auto '
esac

alias la="ls -a"
alias lf="ls -F"
alias ll="ls -l"

alias du="du -h"
alias df="df -h"

alias su="su -l"

#GREP
alias NT="vim -c NERDTree"
alias phpgrep="find ./ -name '*.php' | xargs grep --color=auto"
alias rbgrep="find ./ -name '*.rb' | xargs grep --color=auto"
alias cssgrep="find ./ -name '*.css' | xargs grep --color=auto"
alias jsgrep="find ./ -name '*.js' | xargs grep --color=auto"
alias xmlgrep="find ./ -name '*.xml' | xargs grep --color=auto"
alias ymlgrep="find ./ -name '*.yml' | xargs grep --color=auto"
alias txtgrep="find ./ -name '*.txt' | xargs grep --color=auto"
alias wildgrep="find ./ -name '*' | xargs grep --color=auto"
alias shgrep="find ./ -name '*.sh' | xargs grep --color=auto"
alias tmux="tmux -2"

###############色の設定###############
case "${TERM}" in
xterm)
    export TERM=xterm-color
    ;;
kterm)
    export TERM=kterm-color
    # set BackSpace control character
    stty erase
    ;;
cons25|linux)
    unset LANG
    ;;
esac

unset LSCOLORS
export LSCOLORS=gxfxcxdxbxegedabagacad
zstyle ':completion:*' list-colors 'di=36' 'ln=35' 'so=32' 'ex=31' 'bd=46;34' 'cd=43;34'

case "${OSTYPE}" in
solaris*)
    export LS_COLORS='di=36:ln=35:so=32:pi=33:ex=31:bd=46;34:cd=43;34'
    ;;
*)
    export LS_COLORS='di=36:ln=35:so=32:pi=33:ex=31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'
esac

######################コピペの設定######################
if which pbcopy >/dev/null 2>&1 ; then
    # Mac
    alias -g C='| pbcopy'
elif which xsel >/dev/null 2>&1 ; then
    # Linux
    alias -g C='| xsel --input --clipboard'
elif which putclip >/dev/null 2>&1 ; then
    # Cygwin
    alias -g C='| putclip'
fi
