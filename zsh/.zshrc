#
# ZSH options
#

# History settings
HISTSIZE=100
SAVEHIST=100
HISTFILE=~/.zhistfile

# Source Prezto
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
    source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Source shell colors
local xbase16="/usr/share/base16-shell/base16-ocean.dark.sh"
[[ -s ${xbase16} ]] && source ${xbase16}

# Load bookmark plugin
autoload -Uz cd-bookmark
alias cdb='cd-bookmark'

# Set pager
export PAGER='less'
export LESSHISTFILE='-'

#
# ZSH aliases
#

# coreutils
alias mkdir='mkdir -pv'
alias rmdir='rmdir -pv'
alias mv='mv -v'
alias cp='cp -v'

# grep
alias egrep='grep -E'
alias fgrep='grep -F'

# atool
alias x='aunpack -e'

# mpv
alias mpv='mpv --quiet'

# feh
alias feh='feh --scale-down'

# transmission-remote-cli
alias trc='transmission-remote-cli'

# tmux
alias tmux='tmux -2'

# tintin
alias tintin='tintin -G'
alias tt='tintin'

# envoy
if [[ -x $(which envoy-exec) ]]; then
    # openssh
    alias ssh='envoy-exec ssh'
    alias scp='envoy-exec scp'
    # rsync
    alias rsync='envoy-exec rsync'
    # git
    alias gf="envoy-exec git fetch"
    alias gfm="envoy-exec git pull"
    alias gp="envoy-exec git push"
fi

# Clear prezto aliases
unalias rm

# Extension
alias -s gz='tar -xzvf'
alias -s bz2='tar -xjvf'
alias -s pdf='zathura'
alias -s {mp3,m4a}='mpv --no-audio-display'

#
# Zsh functions
#

# cd to dir and open tmux
dev () {
    local dir=$(pwd)

    [[ -d ${1} ]] && cd ${1}
    if tmux has-session >/dev/null 2>&1 ; then
        tmux attach-session >/dev/null 2>&1
    else
        tmux >/dev/null 2>&1
    fi
    cd ${dir}
}

#
# Terminal fixes
#

# ls colors on termite
if [[ $TERM = 'xterm-termite' ]]; then
    source <(dircolors ~/.dircolors)
fi

# Misbehaving keys
bindkey "\e[7~" beginning-of-line           # Home  # rxvt
bindkey "\e[8~" end-of-line                 # End   # rxvt
bindkey "\eOH"  beginning-of-line           # Home  # guake
bindkey "\eOF"  end-of-line                 # End   # guake
bindkey "\e[H"  beginning-of-line           # Home  # termite
bindkey "\e[F"  end-of-line                 # End   # termite
