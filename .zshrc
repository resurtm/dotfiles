# BEGIN: zsh history
export HISTFILE="$HOME/.zsh_history"
export HISTSIZE=123456
export SAVEHIST=$HISTSIZE
setopt EXTENDED_HISTORY       # Write the history file in the ':start:elapsed;command' format.
setopt HIST_EXPIRE_DUPS_FIRST # Expire a duplicate event first when trimming history.
setopt HIST_FIND_NO_DUPS      # Do not display a previously found event.
setopt HIST_IGNORE_ALL_DUPS   # Delete an old recorded event if a new event is a duplicate.
setopt HIST_IGNORE_DUPS       # Do not record an event that was just recorded again.
setopt HIST_IGNORE_SPACE      # Do not record an event starting with a space.
setopt HIST_SAVE_NO_DUPS      # Do not write a duplicate event to the history file.
setopt SHARE_HISTORY          # Share history between all sessions.
# END: zsh history

# BEGIN: omz
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME=''
COMPLETION_WAITING_DOTS=true
zstyle ':omz:update' mode reminder
plugins=(git kubectl)
source $ZSH/oh-my-zsh.sh
# END: omz

# BEGIN: neovim
alias v='nvim'
vz() {
  NVIM_APPNAME=nvim-lazyvim nvim "$@"
}
# END: neovim

alias hm='NIX_CONFIG="experimental-features = nix-command flakes" home-manager'

# BEGIN: tmux + home/end
# https://gist.github.com/andersevenrud/015e61af2fd264371032763d4ed965b6
# https://stackoverflow.com/a/41786092/571465
# https://stackoverflow.com/a/55616731/571465
# https://stackoverflow.com/a/58842892/571465
bindkey "^[OF" end-of-line
bindkey "^[OH" beginning-of-line
# END: tmux + home/end

eval "$(starship init zsh)"
