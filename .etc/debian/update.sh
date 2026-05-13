#!/usr/bin/env bash
set -euo pipefail

# ┌────────────────────────────┐
# │ Step 1. Update everything. │
# └────────────────────────────┘

# Step 1.1. Nix, Home Manager.
home-manager switch \
	--extra-experimental-features nix-command \
	--extra-experimental-features flakes \
	--flake ~/.config/home-manager#x260
# nix-collect-garbage -d

# Step 1.2. Flatpak.
if [ "$(flatpak config --get languages 2>/dev/null)" != "en;de" ]; then
	flatpak config --set languages "en;de"
fi
flatpak update

# Step 1.3. apt/dpkg.
sudo apt update
sudo apt dist-upgrade
sudo apt autoremove

# Step 1.4. Oh My Zsh, Rust.
zsh "$HOME/.oh-my-zsh/tools/upgrade.sh" # same as "omz update"
rustup update

# ┌──────────────────────────┐
# │ Step 2. Generate report. │
# └──────────────────────────┘

dir="${HOME}/.etc/debian"
ffile="${dir}/01-flatpak.md"
dfile="${dir}/02-deb-apt.md"
efile="${dir}/99-etc.md"

rm -f -- "$ffile" "$dfile" "$efile"
mkdir -p -- "$dir"

# 01-flatpak.md
printf '# Debian Stable, Flatpak\n\n' >>"$ffile"
printf '## Stats\n\n' >>"$ffile"
printf '* Total applications: ' >>"$ffile"
flatpak list --app | wc -l >>"$ffile"
printf '* Total items: ' >>"$ffile"
flatpak list | wc -l >>"$ffile"
printf '\n' >>"$ffile"
printf "## List\n\n" >>"$ffile"
printf '```\n' >>"$ffile"
flatpak list --app --columns=name,application | sort >>"$ffile"
printf '```\n' >>"$ffile"

# 02-deb-apt.md
printf '# Debian Stable, `dpkg`/`apt`\n\n' >>"$dfile"
printf '## Stats\n\n' >>"$dfile"
printf '* Total items: ' >>"$dfile"
apt-mark showmanual | grep -Ev '\-microcode|firmware-' | wc -l >>"$dfile"
printf '\n' >>"$dfile"
printf '## List\n\n' >>"$dfile"
printf '```\n' >>"$dfile"
apt-mark showmanual | grep -Ev '\-microcode|firmware-' | sort >>"$dfile"
printf '```\n' >>"$dfile"

# 99-etc.md
printf '# Debian Stable, Other Things\n\n' >>"$efile"
printf '## Groups\n\n' >>"$efile"
printf '```\n' >>"$efile"
id -nG resurtm | tr ' ' '\n' | sort >>"$efile"
printf '```\n\n' >>"$efile"
printf '## Services & Sockets (`systemd`)\n\n' >>"$efile"
printf '```\n' >>"$efile"
{
	systemctl list-unit-files --type=service --state=enabled,indirect --no-legend
	systemctl list-unit-files --type=socket --state=enabled,indirect --no-legend
} | awk '{print $1}' | sort >>"$efile"
printf '```\n' >>"$efile"

# ┌────────────────────────┐
# │ Step 99. Final things. │
# └────────────────────────┘

fastfetch
