# Theme
set theme_color_scheme gruvbox
set PATH $HOME/.bin $PATH
set GOPATH "/home/axel/.go"
set GOBIN "/home/axel/.go/bin"


# Typos
alias gti='git'
alias docekr='docker'
alias car='cat'

# Aliases
alias ls='ls --color=auto --group-directories-first'
alias ll='exa --group-directories-first -lbg'
alias la='exa --group-directories-first -bga'
alias lal='exa --group-directories-first -lbga'

alias q="cd ../"
alias qq="cd ../../"
alias fishrc="gvim $HOME/.config/fish/config.fish"
alias j="jump"
alias gg="git grep"
alias vimrc='vim $HOME/.vimrc'
alias nvimrc='nvim $HOME/.config/nvim/init.vim'
alias ffind='find . -iname'
alias dof='git --git-dir=$HOME/.dotfiles.git'

function qvim
    nvim-qt $argv 2> /dev/null &
end

function gnvim
    #gonvim $argv > /dev/null ^&1 &
    nvim-gtk $argv > /dev/null ^&1 &
end

# manjaro
if test -e /usr/bin/yaourt
  alias query='yaourt -Ss'
  alias install='yaourt -S'
  alias update='yaourt -Syyu'
  alias updatea='yaourt -Syua --noconfirm'
  alias uninstall='yaourt -Rsc'
  alias orphaned='yaourt -Qdt'
  alias not_installed='_search_not_installed'
end

# FZF
set FZF_DEFAULT_OPTS "--no-height --no-reverse"
set FZF_CTRL_T_OPTS "--preview 'highlight -O ansi -l {} 2> /dev/null; or cat {} 2> /dev/null; or tree -C {} 2> /dev/null | head -200'"
set FZF_CTRL_R_OPTS "--preview 'echo {}' --preview-window down:3:hidden:wrap --bind '?:toggle-preview'"
set FZF_ALT_C_OPTS "--preview 'tree -C {} | head -200'"
