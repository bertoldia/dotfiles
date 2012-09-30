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
alias momify='_momify'
alias dropboxify='_dropboxify'
alias maketex='rubber --force --inplace --pdf *.tex'
alias cleantex='rm *.aux *.dvi *.out *.ps *.log *.pdf'
#alias vim='vim -p'
#alias gvim='gvim -p'
alias rgvim='gvim --remote-tab-silent'
alias rvim='vim --remote-tab-silent'
alias ffind='find . -name'
alias archive='file-roller -d'
alias extract='file-roller -h'
alias bin='ll ~/.bin'
alias gti='git'
alias gg='git grep'
alias trash='_trash'
alias dotfiles='git --git-dir=$HOME/.dotfiles.git'

#rc edit shortcuts
alias bashrc='vim ~/.bashrc'
alias vimrc='gvim ~/.vimrc'
alias aliasedit='gvim ~/.bash_aliases'
alias gitconfig='gvim ~/.gitconfig'
alias sshconfig='gvim ~/.ssh/config'


alias work='cd ${UI_DEV_DIR/com-yottayotta-smsv2}'
alias do-review='cd ~/workspace/cli-review'
alias regression-test='cd ~/workspace/cli-regression-test'

alias vim-cleanup='ffind '*.swp' -exec rm {} \;'

if [ -f /usr/bin/colordiff ]
then
    alias diff='colordiff -cp'
else
    alias diff='diff -cp'
fi

alias reload='source ~/.bashrc'
alias debinstall='sudo dpkg -i'
alias install='sudo apt-get install'
alias uninstall='sudo apt-get remove'

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
    mogrify -resize 1024x768 "$@";
    imrename $@; 
}

# Old
#alias miro='cd $MIRO_ROOT'
#alias drdc='cd $DRDC_ROOT'
#alias webmiro='cd $WEBMIRO_ROOT'
#source $HOME/.miroProfile
