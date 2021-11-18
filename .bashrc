##############################################################################
#  ~/.bashrc: executed by bash(1) for non-login shells.                      #
##############################################################################
#                                                                            #
#  BASH-shell init-config file                                               #
#  ------------------------------------------------------------------------  #
#  Author: Tomasz Rak                                                        #
#                                                                            #
##############################################################################

# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
HISTCONTROL="ignoreboth":"erasedups"
HISTSIZE=1000
HISTFILESIZE=2000
# append to the history file, don't overwrite it
shopt -s histappend
# to review or edit command first
shopt -s histverify

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='exa --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'
    alias diff='diff --color=auto'
    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi
# some more ls aliases
alias l='ls -F --group-directories-first'
alias ll='ls -ailFH --color-scale --icons --group-directories-first'
alias la='ls -Fa --group-directories-first'

# colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi
# ---------------------------------------------------------------
# Tomasz's part
# my own prompt
#PS1='\[\e[01;30m\]\t`if [ $? = 0 ]; then echo "\[\e[32m\] ✔ "; else echo "\[\e[31m\] ✘ "; fi`\[\e[00;35m\]\u\[\e[01;33m\]@\[\e[01;36m\]\h\[\e[01;37m\]:\[\e[01;34m\]\w`[[ $(git status 2> /dev/null) =~ Changes\ to\ be\ committed: ]] && echo "\[\e[33m\]" || echo "\[\e[31m\]"``[[ ! $(git status 2> /dev/null) =~ nothing\ to\ commit,\ working\ .+\ clean ]] || echo "\[\e[32m\]"`$(__git_ps1 "(%s)\[\e[00m\]")\[\e[00m\]\$ '
# Colours in man pages
man() {
	env \
	LESS_TERMCAP_mb=$(tput bold; tput setaf 6) \
	LESS_TERMCAP_md=$(tput bold; tput setaf 6) \
	LESS_TERMCAP_me=$(tput sgr0) \
	LESS_TERMCAP_se=$(tput rmso; tput sgr0) \
	LESS_TERMCAP_ue=$(tput rmul; tput sgr0) \
	LESS_TERMCAP_us=$(tput smul; tput bold; tput setaf 4) \
	LESS_TERMCAP_mr=$(tput rev) \
	LESS_TERMCAP_mh=$(tput dim) \
	LESS_TERMCAP_ZN=$(tput ssubm) \
	LESS_TERMCAP_ZV=$(tput rsubm) \
	LESS_TERMCAP_ZO=$(tput ssupm) \
	LESS_TERMCAP_ZW=$(tput rsupm) \
	man "$@"
}
# for better cd-ing
shopt -s autocd # cd without cd
cd() {
	if [ -n "$1" ]; then
		builtin cd "$@" && echo -e "\nHey TOMASZ you are here--> \e[1;95m $(pwd)\e[m" && l
	else 
		builtin cd ~ && echo -e "\nHey TOMASZ you are here--> \e[1;95m $(pwd)\e[m" && l
	fi
}
# generate random password with given length
genpasswd() {
	local l=$1
       	[ "$l" == "" ] && l=20
      	tr -dc A-Za-z0-9_ < /dev/urandom | head -c ${l} | xargs
}
# custom function for new scripts
newscript() {
if [ -e $1 ]
then
    echo "File already exists"
else
    echo "#!/bin/bash" > $1
    echo "# [Insert description here]" >> $1
    echo "# Created by $USER on $(date +'%x')" >> $1
    vim $1
fi
}

[ -f "$HOME/.config/aliasrc" ] && source "$HOME/.config/aliasrc"
alias c='clear'
alias cls='clear'
alias cd..='cd ..'
alias ..='cd ..'
alias ...='cd ../..'
alias cp='cp -iv'
alias mv='mv -iv'
alias rm='rm -iv'
alias mount='mount | column -t'
alias update='sudo apt update; sudo apt upgrade -y'
alias free='free -hwt'
alias df='df -hT -x squashfs -x tmpfs -x devtmpfs --total'
alias rsync='rsync --progress'
alias in='sudo inxi -Fmrxx'
alias yt='youtube-dl --add-metadata -i'
alias info='pinfo'
alias bat='batcat'
alias ed="ed -v --prompt='Im simple ED: '"
alias v='nvim'
alias z='zathura'
alias extip='curl ipinfo.io/ip'
alias ip="/bin/ip -4 -br a | awk '/UP/{ print $3 }' | cut -f3 | cut -f1 -d'/'"
alias speedtest="curl -s https://raw.githubusercontent.com/sivel/speedtest-cli/master/speedtest.py | python3 -"
alias ports='netstat -tulanp'
alias untar='tar -zxvf'
# to automaticly connect to tmux-ses on thinkpad
alias thinkpad="ssh thinkpad -t tmux a"
# to put history record into clipboard through fuzzy search
alias h="history | cut -c 8- | sort -u | fzf | tr -d '\n' | xclip -selection c"
alias graph='git log --all --decorate --oneline --graph'
alias gitdf='/usr/bin/git --git-dir=$HOME/.dotfiles.git/ --work-tree=$HOME'
alias vdf='GIT_DIR=$HOME/.dotfiles.git GIT_WORK_TREE=$HOME v'

export EDITOR='nvim'
export VISUAL='nvim'
#export FZF_DEFAULT_OPTS="--height=50% --layout=reverse --info=inline --multi --border"
# F2-toggles preview F3-batcat F4-editor M-w-toggle wrap C-y-copy to clipboard C-x-to remove C-l- to clear 
export FZF_DEFAULT_COMMAND='ag --hidden --ignore .git -g ""'
export FZF_DEFAULT_OPTS="--no-mouse --height 50% --reverse --multi --info=inline --preview='$HOME/.vim/plugged/fzf.vim/bin/preview.sh {}' --preview-window='right:60%:nowrap:hidden' --bind='f2:toggle-preview,f3:execute(batcat --style=numbers {} || less -f {}),f4:execute($EDITOR {}),alt-w:toggle-preview-wrap,ctrl-d:half-page-down,ctrl-u:half-page-up,ctrl-y:execute-silent(echo {+} | xclip -selection c),ctrl-x:execute(rm -i {+})+abort,ctrl-l:clear-query'"

source ~/bin/colors
source /usr/share/doc/fzf/examples/key-bindings.bash
source /usr/share/doc/fzf/examples/completion.bash
[ -f ~/.fzf.bash ] && source ~/.fzf.bash

eval "$(starship init bash)"
#xmodmap ~/.speedswapper
stty -ixon # disable ctr-s and ctr-q.
#tmux a
echo -e "Hey TOMASZ you are here--> \e[1;95m $(pwd)\e[m"
l
