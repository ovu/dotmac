alias v="vim"
alias x="exit"
alias g="git"

set fish_color_command "purple"
set fish_color_autosuggestion "yellow"

# Required for powerline-config
set -gx PATH $HOME/Library/Python/3.9/bin $PATH
# Set env  EDITOR used by git-mediate
set -gx EDITOR vim
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

# history across fishes
function save_history --on-event fish_preexec
    history --save
end
alias hr 'history --merge'  # read and merge history from disk
bind \e\[A 'history --merge ; up-or-search'
