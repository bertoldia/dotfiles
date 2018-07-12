# Theme
set theme_color_scheme gruvbox
set PATH $HOME/.bin $PATH
set -x GOPATH $HOME/.go
set -x GOBIN $HOME/.go/bin
set -x EDITOR nvim

# Work stuff
set -x CHALLENGER_ROOT "$HOME/workspace/challenger"
set -x OMNICHANNEL_ROOT "$CHALLENGER_ROOT/omni"

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
alias fishrc="nvim $HOME/.config/fish/config.fish"
alias j="jump"
alias gg="git grep"
alias vimrc='vim $HOME/.vimrc'
alias nvimrc='nvim $HOME/.config/nvim/init.vim'
alias gitconfig='nvim $HOME/.gitconfig'
alias ffind='find . -iname'
alias dof='git --git-dir=$HOME/.dotfiles.git'

# FZF
set -x FZF_DEFAULT_OPTS "--no-height --no-reverse"
set -x FZF_CTRL_T_OPTS "--preview 'highlight -O ansi -l {} 2> /dev/null; or cat {} 2> /dev/null; or tree -C {} 2> /dev/null | head -200'"
set -x FZF_CTRL_R_OPTS "--preview 'echo {}' --preview-window down:3:hidden:wrap --bind '?:toggle-preview'"
set -x FZF_ALT_C_OPTS "--preview 'tree -C {} | head -200'"

