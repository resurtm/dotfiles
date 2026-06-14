#!/usr/bin/env bash
set -euo pipefail
shopt -s expand_aliases

clean=false

for arg in "$@"; do
	case $arg in
	--clean)
		clean=true
		;;
	esac
done

RESET='\033[0m'
BOLD='\033[1m'
CYAN='\033[0;36m'
section() {
	local label="${1:-}"
	local line="══════════════════════════════════════════════"
	printf "\n${BOLD}${CYAN}%s${RESET}\n" "$line"
	[[ -n "$label" ]] && printf "${BOLD}${CYAN}  %s${RESET}\n" "$label"
	printf "${BOLD}${CYAN}%s${RESET}\n\n" "$line"
}

section '🧰 Nix / Home Manager'
hostname="$(hostname)"
alias hm='NIX_CONFIG="experimental-features = nix-command flakes" home-manager'
if [ "$hostname" == big-box ]; then
	hm switch --flake ~/.config/home-manager#tower
elif [ "$hostname" == mini-box ]; then
	hm switch --flake ~/.config/home-manager#mini
elif [ "$hostname" == thinkpad-t14 ]; then
	hm switch --flake ~/.config/home-manager#t14
elif [ "$hostname" == thinkpad-x260 ]; then
	hm switch --flake ~/.config/home-manager#x260
else
	printf 'home-manager -- hostname is not supported\n'
	exit 1
fi

if [ "$clean" = true ]; then
	section '🧹 Nix / Home Manager -- Cleanup'
	nix-collect-garbage -d
	nix-collect-garbage
fi

# comes from the default Home Manager installation, must be removed
[ -f ~/.config/home-manager/home.nix ] && rm ~/.config/home-manager/home.nix

section '🔧 Flatpak'
if [ "$(flatpak --system config --get languages 2>/dev/null)" != "en;de" ]; then
	flatpak --system config --set languages "en;de"
fi
if [ "$(flatpak --user config --get languages 2>/dev/null)" != "en;de" ]; then
	flatpak --user config --set languages "en;de"
fi
flatpak --user update
if [ "$clean" = true ]; then
	section '🧹 Flatpak -- Cleanup'
	flatpak --system remove --unused
	flatpak --user remove --unused
fi

if [ "$hostname" == void ]; then
	section '🌀 XBPS'
	sudo xbps-install -Su
	if [ "$clean" = true ]; then
		section '🧹 XBPS -- Cleanup'
		sudo xbps-remove -o
		sudo xbps-remove -O
		sudo vkpurge rm all
	fi
elif [ "$hostname" == big-box ] || [ "$hostname" == mini-box ]; then
	section '🏗️ Pacman'
	sudo pacman -Syyu
	if [ "$clean" = true ]; then
		section '🏗️ Pacman -- Cleanup'
		orphans=$(pacman -Qdtq) && [[ -n "$orphans" ]] && sudo pacman -Rns $orphans
		sudo paccache -rk2
	fi
elif [ "$hostname" == thinkpad-x260 ]; then
	section '🔮 APT'
	sudo apt update
	sudo apt dist-upgrade
	if [ "$clean" = true ]; then
		section '🧹 APT -- Cleanup'
		sudo apt clean
		sudo apt autoclean
		sudo apt autoremove --purge -y
		dpkg -l | awk '/^rc/ {print $2}' | xargs -r sudo dpkg --purge
		sudo rm -rf /var/lib/apt/lists/*
	fi
elif [ "$hostname" == thinkpad-t14 ]; then
	section '🏁 DNF'
	sudo dnf upgrade --refresh
	if [ "$clean" = true ]; then
		section '🧹 DNF -- Cleanup'
		sudo dnf clean all
		sudo dnf autoremove -y
	fi
else
	printf 'xbps/pacman/apt/dnf -- hostname is not supported\n'
	exit 1
fi

section '⚙️ Rustup'
rustup update

if [ "$clean" = true ]; then
	section '🧹 Rustup -- Cleanup'
	rm -rfv ~/.rustup/downloads
	rm -rfv ~/.cargo/registry/cache
	rm -rfv ~/.cargo/registry/src
	rm -rfv ~/.cargo/git/db
	rm -rfv ~/.cargo/git/checkouts
fi

section '🐚 Oh My Zsh'
zsh "$HOME/.oh-my-zsh/tools/upgrade.sh"

section '📝 Reports'

report_flatpak() {
	printf '# Flatpak\n\n' >>"$1"

	printf '## Stats\n\n' >>"$1"
	printf '* Total applications: ' >>"$1"
	flatpak list --app | wc -l >>"$1"
	printf '* Total items: ' >>"$1"
	flatpak list | grep -vi 'intel' | wc -l >>"$1"
	printf '\n' >>"$1"

	printf "## Applications\n\n" >>"$1"
	printf '```\n' >>"$1"
	flatpak list --app --columns=name,application | sort >>"$1"
	printf '```\n\n' >>"$1"

	printf "## Items\n\n" >>"$1"
	printf '```\n' >>"$1"
	flatpak list --columns=name,application | grep -vi 'intel' | sort >>"$1"
	printf '```\n\n' >>"$1"
}

report_groups() {
	printf '# Groups\n\n' >>"$1"
	printf '```\n' >>"$1"
	id -nG $(whoami) | tr ' ' '\n' | sort >>"$1"
	printf '```\n\n' >>"$1"
}

dir="${HOME}/.tools"
if [ "$hostname" == void ]; then
	file="${dir}/01-void.md"
elif [ "$hostname" == thinkpad-x260 ]; then
	file="${dir}/02-debian.md"
elif [ "$hostname" == big-box ] || [ "$hostname" == mini-box ]; then
	file="${dir}/03-arch.md"
elif [ "$hostname" == thinkpad-t14 ]; then
	file="${dir}/04-fedora.md"
else
	printf 'report -- hostname is not supported\n'
	exit 1
fi

rm -f -- "$file"
report_flatpak "$file"

report_systemd() {
	printf '## Services & Sockets (`systemd`)\n\n' >>"$file"
	printf '### Global, System\n\n' >>"$file"
	printf '```\n' >>"$file"
	{
		systemctl list-unit-files --type=service --state=enabled,indirect --no-legend
		systemctl list-unit-files --type=socket --state=enabled,indirect --no-legend
	} | awk '{print $1}' | sort >>"$file"
	printf '```\n\n' >>"$file"
	printf '### User\n\n' >>"$file"
	printf '```\n' >>"$file"
	{
		systemctl --user list-unit-files --type=service --state=enabled,indirect --no-legend
		systemctl --user list-unit-files --type=socket --state=enabled,indirect --no-legend
	} | awk '{print $1}' | sort >>"$file"
	printf '```\n\n' >>"$file"
}

if [ "$hostname" == void ]; then
	printf 'report -- XBPS\n'
	printf '# XBPS\n\n' >>"$file"

	printf '## Stats\n\n' >>"$file"
	printf '* Total items: ' >>"$file"
	xpkg -m | wc -l >>"$file"
	printf '\n' >>"$file"

	printf '## List\n\n' >>"$file"
	printf '```\n' >>"$file"
	xpkg -m | sort >>"$file"
	printf '```\n\n' >>"$file"

	printf '## Ignored\n\n' >>"$file"
	printf '```\n' >>"$file"
	cat /etc/xbps.d/ignorepkg.conf | sort >>"$file"
	printf '```\n\n' >>"$file"

	printf '## Services (`runit`)\n\n' >>"$file"
	printf '```\n' >>"$file"
	ls /var/service/ | sort >>"$file"
	printf '```\n\n' >>"$file"

	# void doesn't have/use systemd, don't call `report_systemd` here
elif [ "$hostname" == big-box ] || [ "$hostname" == mini-box ]; then
	printf 'report -- pacman\n'
	printf '# `pacman`\n\n' >>"$file"

	printf '## Stats\n\n' >>"$file"
	printf '* Total items (manual): ' >>"$file"
	pacman -Qe | wc -l >>"$file"
	printf '* Total items (all): ' >>"$file"
	pacman -Q | wc -l >>"$file"
	printf '\n' >>"$file"

	printf '## List (manual)\n\n' >>"$file"
	printf '```\n' >>"$file"
	pacman -Qe | awk '{print $1}' | sort >>"$file"
	printf '```\n\n' >>"$file"

	printf '## List (all)\n\n' >>"$file"
	printf '```\n' >>"$file"
	pacman -Q | awk '{print $1}' | sort >>"$file"
	printf '```\n\n' >>"$file"

	report_systemd
elif [ "$hostname" == thinkpad-x260 ]; then
	printf 'report -- dpkg/apt\n'
	printf '# `dpkg`/`apt`\n\n' >>"$file"

	printf '## Stats\n\n' >>"$file"
	printf '* Total items: ' >>"$file"
	apt-mark showmanual | grep -Ev '\-microcode|firmware-' | wc -l >>"$file"
	printf '\n' >>"$file"

	printf '## List\n\n' >>"$file"
	printf '```\n' >>"$file"
	apt-mark showmanual | grep -Ev '\-microcode|firmware-' | sort >>"$file"
	printf '```\n\n' >>"$file"

	report_systemd
elif [ "$hostname" == thinkpad-t14 ]; then
	printf 'report -- rpm/dnf\n'
	printf '# `rpm`/`dnf`\n\n' >>"$file"

	printf '## Stats\n\n' >>"$file"
	printf '* Total items (manual): ' >>"$file"
	dnf repoquery --userinstalled | wc -l >>"$file"
	printf '* Total items (all): ' >>"$file"
	dnf repoquery --installed | wc -l >>"$file"
	printf '\n' >>"$file"

	printf '## List (manual)\n\n' >>"$file"
	printf '```\n' >>"$file"
	dnf repoquery --userinstalled --queryformat '%{name}\n' | sort >>"$file"
	printf '```\n\n' >>"$file"

	printf '## List (all)\n\n' >>"$file"
	printf '```\n' >>"$file"
	dnf repoquery --installed --queryformat '%{name}\n' | sort >>"$file"
	printf '```\n\n' >>"$file"

	report_systemd
fi

report_groups "$file"

report_gnome_extensions() {
  if ! command -v gnome-extensions &>/dev/null; then
    return 0
  fi
  printf '# GNOME Extensions\n\n' >>"$1"
  printf '```\n' >>"$1"
  gnome-extensions list | sort >>"$1"
  printf '```\n\n' >>"$1"
}
report_gnome_extensions "$file"

section '⚠️ Fastfetch'
fastfetch
section '✅ All Done'
