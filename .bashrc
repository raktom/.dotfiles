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
HISTCONTROL=erasedups:ignorespace
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
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'
    alias diff='diff --color=auto'
    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

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
# for better cd-ing option and function
# cd without cd
shopt -s autocd
cd() {
	if [ -n "$1" ]; then
		builtin cd "$@"  && echo && exa -F --group-directories-first --color-scale --icons #&& echo -e "\nHey TOMASZ you are here--> \e[1;95m $(pwd)\e[m"
	else
		builtin cd ~  && echo && exa -F --group-directories-first --color-scale --icons #&& echo -e "\nHey TOMASZ you are here--> \e[1;95m $(pwd)\e[m"
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
    echo -e "#!/bin/bash\n" > $1
    echo "# [Insert description here]" >> $1
    echo "# Created by $USER on $(date +'%x')" >> $1
    $EDITOR +2 $1
fi
}

# as argument put place for weather forecast
weather() { curl -s --connect-timeout 3 -m 5 http://wttr.in/$1; }

[ -f "$HOME/.config/aliasrc" ] && source "$HOME/.config/aliasrc"
alias ls='ls -F --group-directories-first --color=auto --time-style=long-iso'
alias exa='exa -F --group-directories-first --color-scale --icons'
alias l=exa
alias ll='l -alH'
alias la='l -a'
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
alias rsync='rsync -vhP'
alias in='sudo inxi -Fmrxx'
alias yt='youtube-dl --add-metadata -i'
alias info='pinfo'
alias bat='batcat'
alias ed='ed -v --prompt="${green}ED: ${normal}"'
alias v='nvim'
# tldr is simpler then man to get basic info about command
alias m='tldr -t ocean'
alias z='zathura'
alias ip='ip -c'
alias ipext='curl ipinfo.io/ip;echo'
alias ipint="/usr/sbin/ip -br a | awk '/UP/{ print \$3 }'| cut -d/ -f1"
alias speedtest="curl -s https://raw.githubusercontent.com/sivel/speedtest-cli/master/speedtest.py | python3 -"
alias ipt='sudo iptables'
alias ports='netstat -tulanp'
alias untar='tar -zxvf'
# automaticly connect to tmux-ses on thinkpad
alias thinkpad="ssh thinkpad -t tmux a"
# put history record into clipboard through fuzzy search
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
export FZF_TMUX_OPTS="-p"
export VAGRANT_DEFAULT_PROVIDER=libvirt

source ~/.config/colors
source /etc/profile.d/bash_completion.sh
source /usr/share/doc/fzf/examples/key-bindings.bash
source /usr/share/bash-completion/completions/fzf
[ -f ~/.fzf.bash ] && source ~/.fzf.bash

# make CapsLock behave like Ctrl:
setxkbmap -option ctrl:nocaps
# make short-pressed Ctrl behave like Escape:
xcape -e 'Control_L=Escape'
# make CapsLock behave like Ctrl
#dconf write /org/gnome/desktop/input-sources/xkb-options "['caps:ctrl_modifier']"


# Xinput configs (touchpad)
xinput set-prop "DLL075B:01 06CB:76AF Touchpad" "libinput Natural Scrolling Enabled" 1
#xinput set-prop "DLL075B:01 06CB:76AF Touchpad" "libinput Click Method Enabled" 0 1
xinput set-prop "DLL075B:01 06CB:76AF Touchpad" "libinput Disable While Typing Enabled" 0
eval "$(starship init bash)"
eval "$(pandoc --bash-completion)"
#xmodmap ~/scripts/speedswapper
stty -ixon # disable ctr-s and ctr-q.
#tmux a
l
if [ -x "$(command -v tmux)" ] && [ -n "${DISPLAY}" ] && [ -z "${TMUX}" ]; then
    tmux attach || tmux >/dev/null 2>&1
fi

#if ! systemctl --user is-active --quiet tmux.service; then
#    systemctl --user start tmux.service
#fi
#exec tmux attach-session -d -t "${USER}" >/dev/null 2>&1
# gpg might need it when pinentry problem occure
#export GPG_TTY=$(tty)
# set SSH_AUTH_SOCK so that SSH will use gpg-agent instead of ssh-agent
# add enable-ssh-support to .gnupg/gpg-agent.conf and kill gpg-agent
#export SSH_AUTH_SOCK="$(gpgconf --list-dirs agent-ssh-socket)"
