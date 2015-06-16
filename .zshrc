# --------------------------------------------------------
# for colors
# --------------------------------------------------------
autoload colors
colors

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

# --------------------------------------------------------
# for prompt
# --------------------------------------------------------
PROMPT="%{${fg[magenta]}%}$(echo ${USER}@Local) "
PROMPT2="%B%{${fg[red]}%}%_#%{${reset_color}%}%b "
SPROMPT="%B%{${fg[red]}%}%r is correct? [n,y,a,e]:%{${reset_color}%}%b "
RPROMPT="%B%{${fg[red]}%}%//.%{${reset_color}%}%b "
[ -n "${REMOTEHOST}${SSH_CONNECTION}" ] &&
    PROMPT="%{${fg[magenta]}%}$(echo ${USER}@${HOST%%.*}) "

# --------------------------------------------------------
# for key mapping to use command history
# --------------------------------------------------------
autoload history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "^p" history-beginning-search-backward-end
bindkey "^n" history-beginning-search-forward-end

# --------------------------------------------------------
# for command history
# --------------------------------------------------------
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt hist_ignore_dups  # ignore duplication command
setopt share_history     # share command history data

# --------------------------------------------------------
# for auto completion
# --------------------------------------------------------
autoload -U compinit
compinit

# --------------------------------------------------------
# for aliases
# --------------------------------------------------------
alias NT="vim -c NERDTree"
alias wildgrep="find ./ -name '*' | xargs grep --color=auto"
alias pygrep="find ./ -name '*.py' | xargs grep --color=auto"
alias rbgrep="find ./ -name '*.rb' | xargs grep --color=auto"
alias phpgrep="find ./ -name '*.php' | xargs grep --color=auto"
alias cssgrep="find ./ -name '*.css' | xargs grep --color=auto"
alias jsgrep="find ./ -name '*.js' | xargs grep --color=auto"
alias shgrep="find ./ -name '*.sh' | xargs grep --color=auto"
alias xmlgrep="find ./ -name '*.xml' | xargs grep --color=auto"
alias ymlgrep="find ./ -name '*.yml' | xargs grep --color=auto"
alias twiggrep="find ./ -name '*.twig' | xargs grep --color=auto"
alias txtgrep="find ./ -name '*.txt' | xargs grep --color=auto"

# --------------------------------------------------------
# for utility
# --------------------------------------------------------
# auto change directory
setopt auto_cd

# auto directory pushd that you can dirs list by cd -[tab]
setopt auto_pushd
setopt pushd_ignore_dups

# command correct edition before each completion attempt
setopt correct

# compacked complete list display
setopt list_packed

# put slash on tail of path when you use auto completion
setopt noautoremoveslash

# no beep sound when complete list displayed
setopt nolistbeep

# vi like keybind
bindkey -v
