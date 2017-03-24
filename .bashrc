# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

if [ -f /usr/share/git/completion/git-prompt.sh ]
then
  source /usr/share/git/completion/git-prompt.sh
fi

if [ -f /usr/share/git/completion/git-completion.bash ]
then
  source /usr/share/git/completion/git-completion.bash
fi

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
PS1="$white\u$blue@$yellow\h $purple\$(__git_ps1 ' %s ')$green\W$default: "

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

if [ -f ~/.bash_aliases ]; then
    source ~/.bash_aliases
fi

# SMS build env
if [ -f ~/.build_environment ]; then
  source ~/.build_environment
fi

if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
    source /etc/bash_completion
fi

POWERLINE_SH="/usr/lib/python2.7/site-packages/powerline/bindings/bash/powerline.sh"
if [ -f $POWERLINE_SH ]; then
  source $POWERLINE_SH
fi

OH_MY_GIT=".oh-my-git/prompt.sh"
if [ -f ~/$OH_MY_GIT ]; then
  source ~/.oh-my-git/base.sh
  source ~/$OH_MY_GIT
fi
