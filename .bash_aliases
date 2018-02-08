alias reload='source ~/.bashrc'

# Core
alias ll='ls -hlF'
alias lall='ls -hlaF'
alias q='lcd ../'
alias cd='lcd'
alias mkdir='mkdir -p'
alias df='df -h'
alias du='du -h'
alias ffind='find . -iname'
alias archive='file-roller -d'
alias extract='file-roller -h'
alias bin='ll ~/.bin'
alias gg='git grep'
alias gitd='git-dag'
alias dof='git --git-dir=$HOME/.dotfiles.git'
alias locate='locate -e'

# Typos
alias gti='git'
alias docekr='docker'
alias car='cat'

[ -f /usr/bin/htop ] && alias top='htop -d 12'

# Images manipulation
alias momify='_momify'
alias dropboxify='_dropboxify'

alias maketex='rubber --force --inplace --pdf *.tex'
alias cleantex='rm *.aux *.dvi *.out *.ps *.log *.pdf'

# vim
alias rgvim='gvim --remote-tab-silent'
alias rvim='vim --remote-tab-silent'
#alias gnvim='$HOME/.local/bin/pynvim --font "Source Code Pro Medium" 10'
#alias gnvim-update='/usr/bin/pip install -U --user neovim-gui'
#alias gnvim='$HOME/.config/nvim/bundle/nvim-pygtk3/nvim-pygtk3'
qvim() { nvim-qt "$@" 2> /dev/null & }
gonvim() { /usr/bin/gonvim "$@" &> /dev/null & }
alias gtk-nvim='~/.config/nvim/bundle/nvim-pygtk3/nvim-pygtk3'
alias vimrc='vim ~/.vimrc'
alias nvimrc='nvim ~/.config/nvim/init.vim'
alias vim-cleanup='ffind '*.swp' -exec rm {} \;'

# rc edit shortcuts
alias bashrc='nvim ~/.bashrc'
alias aliasedit='nvim ~/.bash_aliases'
alias gitconfig='nvim ~/.gitconfig'
alias sshconfig='nvim ~/.ssh/config'

alias thesaurus='aiksaurus'

# task
alias ta='task add'
alias tf='task done'
alias td='task delete'
alias ts='task start'
alias tp='task stop'
alias tm='task modify'

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

if [ -f /usr/bin/colordiff ]; then
    alias diff='colordiff -cp'
else
    alias diff='diff -cp'
fi

#CEC VM's
alias win10='rdesktop -x -P 10.244.117.58 -u Administrator -p Password123! -g 1280x1024'

function lcd() {
    builtin cd "$@";
    clear;
    ll;
}

function _trash() {
  mv "$@" ~/.local/share/Trash/files/;
}

function _momify() {
    mogrify -resize 800x600 "$@";
    imrename $@;
}

function _dropboxify() {
    #mogrify -resize 1024x768 "$@";
    mogrify -resize 1280x1024 "$@";
    imrename $@;
}

function _search_not_installed() {
  pacman -Ss $1 | pcregrep -vM 'installed.*\n.*'
}
