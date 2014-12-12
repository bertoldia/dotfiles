# Path to your oh-my-fish.
set fish_path $HOME/.oh-my-fish

# Theme
set fish_theme bobthefish
set -g __fish_git_prompt_show_informative_status 1
set -g __fish_git_prompt_color_branch magenta bold

# Aliases
alias q="cd ../"
alias qq="cd ../../"
alias fishrc="gvim $HOME/.config/fish/config.fish"
alias j="jump"
alias gg="git grep"
alias vimrc='gvim $HOME/.vimrc'
alias ffind='find . -name'
alias dof='git --git-dir=$HOME/.dotfiles.git'

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-fish/plugins/*)
# Custom plugins may be added to ~/.oh-my-fish/custom/plugins/
# Example format: set fish_plugins autojump bundler
set fish_plugins archlinux/pacman jump

# Path to your custom folder (default path is $FISH/custom)
#set fish_custom $HOME/dotfiles/oh-my-fish

# Load oh-my-fish configuration.
. $fish_path/oh-my-fish.fish
