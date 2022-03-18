alias v="vim"
alias x="exit"
alias g="git"

set fish_color_command "purple"
set fish_color_autosuggestion "yellow"

# Set colors for command ls
# Colors can be customized in https://geoff.greer.fm/lscolors/
set -Ux LSCOLORS gxfxcxdxBxegxdabagacad

# Required for powerline-config
set -gx PATH $HOME/Library/Python/3.8/bin $PATH

# Required for git-mediate
set -gx PATH $HOME/.local/bin $PATH

# Required for tmux and other tools installed with brew
set -gx PATH /opt/homebrew/bin $PATH

# opt is required to compile with stack
set -gx PATH /opt/homebrew/opt/llvm@12/bin $PATH

# Required for scala installer (coursier)
set -gx PATH $HOME/Library/Application\ Support/Coursier/bin $PATH

set -gx IVY_HOME $HOME/.ivy

set -gx JAVA_HOME /Library/Java/JavaVirtualMachines/zulu-8.jdk/Contents/Home

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
