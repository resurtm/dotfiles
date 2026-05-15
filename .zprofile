. "$HOME/.nix-profile/etc/profile.d/hm-session-vars.sh"

[[ -s "$HOME/.cargo/env" ]] && source "$HOME/.cargo/env"

if [ -f /opt/homebrew/bin/brew ]; then
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi
