# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively AND a login shell don't do anything. We need
# both conditions to be albe to work correctly with tmux (which is both
# interactive and login) and also spgear scripts (which are login but not
# interactive).
if [[ -z $PS1 ]] && shopt -q login_shell; then return
fi
#[ -z "$PS1" ] && return

# don't put duplicate lines in the history. See bash(1) for more options
# ... or force ignoredups and ignorespace
HISTCONTROL=ignoredups:ignorespace
HISTIGNORE=ls:ll:la:cd:pwd:exit:mc:df:[fb]g:exit
# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000
# append to the history file, don't overwrite it
shopt -s histappend

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "$debian_chroot" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

black='\[\e[1;30m\]'
red='\[\e[1;31m\]'
green='\[\e[1;32m\]'
yellow='\[\e[1;33m\]'
blue='\[\e[1;34m\]'
purple='\[\e[1;35m\]'
cyan='\[\e[1;36m\]'
white='\[\e[1;37m\]'
default='\[\e[0m\]'
PS1="$green\w $purple\$(__git_ps1 "{%s}")\n$blue\@ $white\u$blue@$yellow\h$blue:$default "
#PS1="$blue[$white\u$blue@$yellow\h:$blue\W$purple\$(__git_ps1 "{%s}")$blue]$default "
#PS1="$blue[$purple\d \T:$white\u$blue@$yellow\h:$blue\W$purple\$(__git_ps1 "{%s}")$blue]$default\n"

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
    alias ls='LC_COLLATE=C ls --color=auto --group-directories-first'

    alias dir='dir --color=auto'
    alias vdir='vdir --color=auto'
    alias grep='egrep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

export INPUTRC=~/.inputrc
export EDITOR=vim

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# SMS build env
if [ -f ~/.build_environment ]; then
  . ~/.build_environment
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
    . /etc/bash_completion
fi

ll
