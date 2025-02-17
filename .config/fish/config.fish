if test -e ~/.config/fish/.fish_variable
  source ~/.config/fish/.fish_variable
end
source ~/.config/fish/.fish_aliases

# Y u no English
set -x LANG 'en_US.UTF-8'
set -x LC_ALL 'en_US.UTF-8'

# Editor
set -x EDITOR nvim

# FZF Setup 
set -x FZF_DEFAULT_COMMAND 'rg --files --hidden 2> /dev/null'
set -x FZF_FIND_FILE_COMMAND "$FZF_DEFAULT_COMMAND"
set -x FZF_CTRL_T_COMMAND "$FZF_DEFAULT_COMMAND"
set -x FZF_COMPLETE 1

# Tmux
function fs -d "Switch Tmux session"
  tmux list-sessions -F "#{session_name}" | fzf --reverse | xargs tmux switch-client -t
end

# Convenience PATH
set -x WORKSPACE "$HOME/Documents/Workspace"

# Golang
set -x GOPATH "$WORKSPACE/go"
set -x PATH $GOPATH/bin $PATH
set -x PATH $HOME/.bin $PATH
set -x PATH $HOME/bin $PATH

# https://github.com/khoi/go-git-get
set -x GITPATH $WORKSPACE/Repositories/

# Remap vim to nvim
if type -q nvim > /dev/null 2>&1
  alias vi "nvim"
  alias vim "nvim"
end

# Rbenv
if type -q rbenv
  status --is-interactive; and source (rbenv init -|psub)
end

# compass
if type -q compass
  status --is-interactive; and source (compass shell --type fish --bind-to s -|psub)
end
