# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively AND a login shell don't do anything. We need
# both conditions to be able to work correctly with tmux (which is both
# interactive and login) and also spgear scripts (which are login but not
# interactive).
#[ -z $PS1 ] && shopt -q login_shell && return
[[ $- != *i* ]] && return

[[ $DISPLAY ]] && shopt -s checkwinsize

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
   xterm*|rxvt*|Eterm|aterm|kterm|gnome*)
    PROMPT_COMMAND=${PROMPT_COMMAND:+$PROMPT_COMMAND; }'printf "\033]0;%s@%s:%s\007" "${USER}" "${HOSTNAME%%.*}" "${PWD/#$HOME/\~}"'

    ;;
  screen*)
    PROMPT_COMMAND=${PROMPT_COMMAND:+$PROMPT_COMMAND; }'printf "\033_%s@%s:%s\033\\" "${USER}" "${HOSTNAME%%.*}" "${PWD/#$HOME/\~}"'
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

git_completion=/usr/share/git/completion/git-completion.bash
[ -f $git_completion ] && source $git_completion

if [ -f "/usr/local/opt/bash-git-prompt/share/gitprompt.sh" ]; then
    __GIT_PROMPT_DIR="/usr/local/opt/bash-git-prompt/share"
    source "/usr/local/opt/bash-git-prompt/share/gitprompt.sh"
fi

[ -f ~/.bash_aliases ] && source ~/.bash_aliases
[ -f ~/.build_environment ] && source ~/.build_environment
[ -f /etc/bash_completion ] && ! shopt -oq posix && source /etc/bash_completion

POWERLINE_SH="/usr/lib/python3.6/site-packages/powerline/bindings/bash/powerline.sh"
if [ -f $POWERLINE_SH ]; then
  powerline-daemon -q
  POWERLINE_BASH_CONTINUATION=1
  POWERLINE_BASH_SELECT=1
  source $POWERLINE_SH
fi

[ -f ~/.oh-my-git/base.sh ] && source ~/.oh-my-git/base.sh
[ -f ~/.oh-my-git/prompt.sh ] && source ~/.oh-my-git/prompt.sh

[ -f ~/.fzf.bash ] && source ~/.fzf.bash
