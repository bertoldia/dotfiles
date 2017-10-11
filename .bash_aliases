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
gonvim() { /usr/bin/gonvim "$@" &> /dev/null & }

alias ffind='find . -iname'
alias archive='file-roller -d'
alias extract='file-roller -h'
alias bin='ll ~/.bin'
alias gti='git'
alias gg='git grep'
alias gitd='git-dag'
alias trash='_trash'
alias dof='git --git-dir=$HOME/.dotfiles.git'

alias docekr='docker'

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
alias nsfw-config='rm -f work/config.* ; ./configure PLATFORM=linux BUILD_UNITTESTS=no\
                   BUILD_TESTS=no PYTHON=/usr/bin/python2 BUILD_PYTHON_GRPC_STUBS=yes\
                   BUILD_GO_GRPC_STUBS=yes --automatic'

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
  alias not_installed='_search_not_installed'
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

#CEC VM's
alias win10='rdesktop -x -P 10.244.117.58 -u Administrator -p Password123! -g 1280x1024'
alias win7='rdesktop -x -P 10.244.117.58 -u Administrator -p Password123! -g 1280x1024'

function _ui_review() {
  cd $UI_DEV_DIR
  git fetch
  tig origin/$1
}

function _nsfw_review() {
  cd $NSFW_DEV_DIR
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

function _search_not_installed() {
  pacman -Ss $1 | pcregrep -vM 'installed.*\n.*'
}
