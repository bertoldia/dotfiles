alias ll='ls -hlF'
alias lall='ls -hlaF'

alias q='lcd ../'
alias cd='lcd'
alias go='gnome-open'
alias df='df -h'
alias du='du -h'
if [ -f /usr/bin/colormake ]; then
    alias make='colormake -j4'
else
    alias make='make -j4'
fi

if [ -f /usr/bin/htop ]; then
  alias top='htop -d 12'
fi
alias locate='locate -e'
alias car='cat'
#alias vim='vim -p'
#alias gvim='gvim -p'
alias rgvim='gvim --remote-tab-silent'
alias rvim='vim --remote-tab-silent'
alias gnvim='nvim-wrapper'
alias ffind='find . -iname'
alias archive='file-roller -d'
alias extract='file-roller -h'
alias bin='ll ~/.bin'
alias gti='git'
alias gg='git grep'
alias gitd='git-dag'
alias trash='_trash'
alias dof='git --git-dir=$HOME/.dotfiles.git'

#rc edit shortcuts
alias bashrc='vim ~/.bashrc'
alias vimrc='gvim ~/.vimrc'
alias aliasedit='gvim ~/.bash_aliases'
alias gitconfig='gvim ~/.gitconfig'
alias sshconfig='gvim ~/.ssh/config'

#runner
alias ctest='/home/runner/bin/ctest'
alias rtest='/home/runner/bin/rtest'
alias runner='echo "Usage: runner-SYSTEM <D10|D20> [extra args]"'
alias runner-argonaut-disruptor-h='runner-bin argonaut-disruptor-h'
alias runner-argo-large-geo-nst-e='runner-bin argo-large-geo-nst-e'
alias runner-argo-small-geo-nst-e='runner-bin argo-small-geo-nst-e'
alias runner-wild-small-geo-full-nst-e='runner-bin wild-small-geo-full-nst-e'
alias runner-wild-small-geo-nst-e='runner-bin wild-small-geo-nst-e'
alias runner-wild-small-metro-nst-e='runner-bin wild-small-metro-nst-e'
alias runner-wildcatve-disruptor-e='runner-bin wildcatve-disruptor-e'
alias runner-sms-mario-1='runner-bin sms-mario-1'
alias runner-sms-dev-6='runner-bin sms-dev-6'

alias work='cd ${UI_DEV_DIR}/com-emc-vplex-smsv2'
alias ui-review='_ui_review'
alias nsfw-review='_nsfw_review'
alias regression-test='cd ${UI_REGRESSION_DIR}'

alias vim-cleanup='ffind '*.swp' -exec rm {} \;'

if [ -f /usr/bin/yaourt ]; then
  alias query='yaourt -Ss'
  alias install='yaourt -S'
  alias update='yaourt -Syyu'
  alias updatea='yaourt -Syua --noconfirm'
  alias uninstall='yaourt -Rsc'
  alias orphaned='yaourt -Qdt'
elif [ -f /usr/bin/apt-get ]; then
  alias install='sudo apt-get install'
  alias uninstall='sudo apt-get remove'
fi

if [ -f /usr/bin/pacman-color ]; then
    alias pacman='pacman-color'
fi

if [ -f /usr/bin/colordiff ]; then
    alias diff='colordiff -cp'
else
    alias diff='diff -cp'
fi

alias reload='source ~/.bashrc'

function _ui_review() {
  cd $UI_REVIEW_DIR
  branch_exists=`git br | grep ${1} | wc -l`
  if [ $branch_exists == 1  ]; then
    git co $1
    git pull
  else
    git fetch
    git co -b $1 origin/$1
  fi
  tig
}

function _nsfw_review() {
  cd $NSFW_REVIEW_DIR
  branch_exists=`git br | grep ${1} | wc -l`
  if [ $branch_exists == 1  ]; then
    git co $1
    git pull
  else
    git fetch
    git co -b $1 origin/$1
  fi
  #tig snac/doc/cic.txt
  last_merge=`git rev-list --merges HEAD | head -n 1`
  tig "${last_merge}..." snac/doc/cic.txt
}

function lcd() {
    builtin cd "$@";
    clear;
    ll;
}

function _trash() {
  mv "$@" ~/.local/share/Trash/files/;
}
