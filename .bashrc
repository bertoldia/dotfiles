# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively AND a login shell don't do anything. We need
# both conditions to be able to work correctly with tmux (which is both
# interactive and login) and also spgear scripts (which are login but not
# interactive).
if [[ -z $PS1 ]] && shopt -q login_shell; then return
fi
#[ -z "$PS1" ] && return

[[ -n $SSH_CONNECTION ]] && [[ $(pgrep -c tmux) -gt 0 ]] && tmux ls

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
export PAGER=most

[ -f ~/.bash_aliases ] && source ~/.bash_aliases
[ -f ~/.build_environment ] && source ~/.build_environment
bash_completion=/usr/share/bash-completion/bash_completion
[ -f $bash_completion ] && ! shopt -oq posix && source $bash_completion
git_prompt=/usr/share/git/git-prompt.sh
[ -f $git_prompt ] && source $git_prompt
git_completion=/usr/share/git/completion/git-completion.bash
[ -f $git_completion ] && source $git_completion

POWERLINE_SH="/usr/lib/python3.6/site-packages/powerline/bindings/bash/powerline.sh"
OH_MY_GIT="$HOME/.oh-my-git/prompt.sh"
if [ -f $POWERLINE_SH ]; then
  source $POWERLINE_SH
elif [ -f $OH_MY_GIT ]; then
  source ~/.oh-my-git/base.sh
  source $OH_MY_GIT
fi

FZF=/usr/share/fzf/key-bindings.bash
[ -f $FZF ] && source $FZF


