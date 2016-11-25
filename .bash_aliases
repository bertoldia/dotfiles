alias ll='ls -hlF'
alias lall='ls -hlaF'

alias q='lcd ../'
alias cd='lcd'
alias mkdir='mkdir -p'
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
alias gnvim='$HOME/.local/bin/pynvim --font "Source Code Pro Medium" 10'
alias gnvim-update='/usr/bin/pip install -U --user neovim-gui'
qvim() { nvim-qt "$@" 2> /dev/null & }

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
alias bashrc='nvim ~/.bashrc'
alias vimrc='vim ~/.vimrc'
alias nvimrc='nvim ~/.config/nvim/init.vim'
alias aliasedit='nvim ~/.bash_aliases'
alias gitconfig='nvim ~/.gitconfig'
alias sshconfig='nvim ~/.ssh/config'

# vplex
alias work='cd ${UI_DEV_DIR}/com-emc-vplex-smsv2'
alias ui-review='_ui_review'
alias nsfw-review='_nsfw_review'
alias regression-test='cd ${UI_REGRESSION_DIR}'

alias vim-cleanup='ffind '*.swp' -exec rm {} \;'

# dolphin
alias dlog='python $DOLPHIN_DEV_DIR/dlog/dlog.py'

# manjaro
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
