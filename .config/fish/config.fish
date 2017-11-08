# Theme
set fish_theme bobthefish
set theme_color_scheme gruvbox

# Plugins
#set fish_plugins vi-mode
#set fish_plugins autojump vi-mode
#set fish_plugins vi-mode fzf-autojump fzf


# Aliases
alias ls='ls --color=auto --group-directories-first'
alias ll='ls -lhF'
alias lall='ls -lhaF'
alias q="cd ../"
alias qq="cd ../../"
alias fishrc="gvim $HOME/.config/fish/config.fish"
alias j="jump"
alias gg="git grep"
alias vimrc='gvim $HOME/.vimrc'
alias ffind='find . -name'
alias dof='git --git-dir=$HOME/.dotfiles.git'
alias ll="exa -bgl --color=automatic --group-directories-first"
alias la="exa -abgl --color=automatic --group-directories-first"

function qvim
    nvim-qt $argv 2> /dev/null &
end

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
#export FZF_CTRL_T_OPTS="--preview 'highlight -O ansi -l {} 2> /dev/null; or cat {} 2> /dev/null; or tree -C {} 2> /dev/null | head -200'"
export FZF_CTRL_T_OPTS="--preview 'highlight -O ansi -l {} 2> /dev/null; or cat {} | head -200'"
export FZF_CTRL_R_OPTS="--preview 'echo {}' --preview-window down:3:hidden:wrap --bind '?:toggle-preview'"
export FZF_ALT_C_OPTS="--preview 'tree -C {} | head -200'"
