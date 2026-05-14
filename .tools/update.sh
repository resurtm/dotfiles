#!/usr/bin/env bash
set -euo pipefail
shopt -s expand_aliases

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

if [ "$(flatpak --system config --get languages 2>/dev/null)" != "en;de" ]; then
	flatpak --system config --set languages "en;de"
fi
if [ "$(flatpak --user config --get languages 2>/dev/null)" != "en;de" ]; then
	flatpak --user config --set languages "en;de"
fi
flatpak --user update

if [ "$hostname" == big-box ] || [ "$hostname" == mini-box ]; then
	sudo xbps-install -Su
	sudo xbps-remove -o
elif [ "$hostname" == thinkpad-t14 ] || [ "$hostname" == thinkpad-x260 ]; then
	sudo apt update
	sudo apt dist-upgrade
	sudo apt autoremove
else
	printf 'xbps/apt -- hostname is not supported\n'
	exit 1
fi

rustup update
zsh "$HOME/.oh-my-zsh/tools/upgrade.sh"

report_flatpak() {
	printf '# Flatpak\n\n' >>"$1"

	printf '## Stats\n\n' >>"$1"
	printf '* Total applications: ' >>"$1"
	flatpak list --app | wc -l >>"$1"
	printf '* Total items: ' >>"$1"
	flatpak list | wc -l >>"$1"
	printf '\n' >>"$1"

	printf "## Applications\n\n" >>"$1"
	printf '```\n' >>"$1"
	flatpak list --app --columns=name,application | sort >>"$1"
	printf '```\n\n' >>"$1"

	printf "## Items\n\n" >>"$1"
	printf '```\n' >>"$1"
	flatpak list --columns=name,application | sort >>"$1"
	printf '```\n\n' >>"$1"
}

report_groups() {
	printf '# Groups\n\n' >>"$1"
	printf '```\n' >>"$1"
	id -nG resurtm | tr ' ' '\n' | sort >>"$1"
	printf '```\n\n' >>"$1"
}

dir="${HOME}/.tools"
if [ "$hostname" == big-box ] || [ "$hostname" == mini-box ]; then
	file="${dir}/01-void.md"
elif [ "$hostname" == thinkpad-t14 ] || [ "$hostname" == thinkpad-x260 ]; then
	file="${dir}/02-debian.md"
else
	printf 'report -- hostname is not supported\n'
	exit 1
fi

rm -f -- "$file"
report_flatpak "$file"

if [ "$hostname" == big-box ] || [ "$hostname" == mini-box ]; then
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
elif [ "$hostname" == thinkpad-t14 ] || [ "$hostname" == thinkpad-x260 ]; then
	printf '# `dpkg`/`apt`\n\n' >>"$file"

	printf '## Stats\n\n' >>"$file"
	printf '* Total items: ' >>"$file"
	apt-mark showmanual | grep -Ev '\-microcode|firmware-' | wc -l >>"$file"
	printf '\n' >>"$file"

	printf '## List\n\n' >>"$file"
	printf '```\n' >>"$file"
	apt-mark showmanual | grep -Ev '\-microcode|firmware-' | sort >>"$file"
	printf '```\n\n' >>"$file"

	printf '## Services & Sockets (`systemd`)\n\n' >>"$file"
	printf '```\n' >>"$file"
	{
		systemctl list-unit-files --type=service --state=enabled,indirect --no-legend
		systemctl list-unit-files --type=socket --state=enabled,indirect --no-legend
	} | awk '{print $1}' | sort >>"$file"
	printf '```\n\n' >>"$file"
fi

report_groups "$file"

fastfetch
