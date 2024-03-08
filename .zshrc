# -- powerlevel10k
# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# -- omz installation path
export ZSH="$HOME/.oh-my-zsh"

# -- theme
# ZSH_THEME="robbyrussell"
# ZSH_THEME="agnoster"
# ZSH_THEME="jonathan"
ZSH_THEME="powerlevel10k/powerlevel10k"

# -- omz update logic
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# show three dots while autocompletion is thinking
COMPLETION_WAITING_DOTS="true"

# enabled plugins
plugins=(git direnv rust)

# launch omz
source $ZSH/oh-my-zsh.sh

# -- nvm/node.js
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# -- rust/cargo
. "$HOME/.cargo/env"

# -- golang specific version
# export PATH=$PATH:/usr/local/go/bin
# export PATH=$PATH:/home/resurtm/.gvm/gos/go1.22.0/bin/go

# -- gvm
[[ -s "/home/resurtm/.gvm/scripts/gvm" ]] && source "/home/resurtm/.gvm/scripts/gvm"

# -- neovim/nvim
# https://michaeluloth.com/neovim-switch-configs/
alias v='nvim'
alias vz='NVIM_APPNAME=nvim-lazyvim nvim'
alias vc='NVIM_APPNAME=nvim-nvchad nvim'
alias vk='NVIM_APPNAME=nvim-kickstart nvim'
alias va='NVIM_APPNAME=nvim-astrovim nvim'
alias vl='NVIM_APPNAME=nvim-lunarvim nvim'
vv() {
  select config in lazyvim kickstart nvchad astrovim lunarvim
  do NVIM_APPNAME=nvim-$config nvim $@; break; done
}

# -- tmux + home/end keys
# https://gist.github.com/andersevenrud/015e61af2fd264371032763d4ed965b6
# https://stackoverflow.com/a/41786092/571465
# https://stackoverflow.com/a/55616731/571465
# https://stackoverflow.com/a/58842892/571465
bindkey "^[OF" end-of-line
bindkey "^[OH" beginning-of-line

# -- docker armageddon scripts
# https://gist.github.com/dz-s/586c0b576d1afc1bf3962732c57d761a
docker_rm_conts() {
  docker stop $(docker ps -aq)
  docker rm $(docker ps -aq)
}
docker_arma() {
  docker_rm_conts
  docker network prune -f
  docker rmi -f $(docker images --filter dangling=true -qa)
  docker volume rm $(docker volume ls --filter dangling=true -q)
  docker rmi -f $(docker images -qa)
}

# -- speed up yadm auto-completion
# 1. https://stackoverflow.com/a/76746393/571465
unsetopt pathdirs
# 2. https://github.com/TheLocehiliosan/yadm/issues/355#issuecomment-1065956317
__git_files () {
    _wanted files expl 'local files' _files
}

# -- powerlevel10k theme
# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# -- sdkman
# !!! THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK !!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"
