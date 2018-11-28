alias reload='source ~/.bashrc'

# Core
alias ll='exa --group-directories-first -lbg'
alias la='exa --group-directories-first -bga'
alias lal='exa --group-directories-first -lbga'

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
alias rgvim='gvim --remote-tab-silent'
alias rvim='vim --remote-tab-silent'
alias gnvim='$HOME/.local/bin/pynvim --font "Source Code Pro Medium" 10'
alias gnvim-update='/usr/bin/pip install -U --user neovim-gui'
qvim() { nvim-qt "$@" 2> /dev/null & }

alias ffind='find . -iname'
alias archive='file-roller -d'
alias extract='file-roller -h'
alias bin='ll ~/.bin'
alias gg='git grep'
alias dof='git --git-dir=$HOME/.dotfiles.git'
alias locate='locate -e'

# Typos
alias gti='git'
alias docekr='docker'
alias car='cat'

[ -f /usr/bin/htop ] && alias top='htop -d 12'

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

if [ -f /usr/bin/colordiff ]; then
    alias diff='colordiff -cp'
else
    alias diff='diff -cp'
fi

function lcd() {
    builtin cd "$@";
    clear;
    ll;
}

function _trash() {
  mv "$@" ~/.local/share/Trash/files/;
}

function _dropboxify() {
    #mogrify -resize 1024x768 "$@";
    mogrify -resize 1280x1024 "$@";
    imrename $@;
}
