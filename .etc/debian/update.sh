#!/usr/bin/env sh
set -euo pipefail

dir="${HOME}/.etc/debian"
ffile="${dir}/flatpak.md"
dfile="${dir}/deb-apt.md"
efile="${dir}/etc.md"

rm -f -- "$ffile" "$dfile" "$efile"
mkdir -p -- "$dir"

echo '# Debian Stable, Flatpak\n' >>"$ffile"
echo '## Stats\n' >>"$ffile"
echo -n '* Total applications: ' >>"$ffile"
flatpak list --app | wc -l >>"$ffile"
echo -n '* Total items: ' >>"$ffile"
flatpak list | wc -l >>"$ffile"
echo '' >>"$ffile"
echo '## List\n' >>"$ffile"
echo '```' >>"$ffile"
flatpak list --app --columns=name,application | sort >>"$ffile"
echo '```' >>"$ffile"

echo '# Debian Stable, `dpkg`/`apt`\n' >>"$dfile"
echo '## Stats\n' >>"$dfile"
echo -n '* Total items: ' >>"$dfile"
apt-mark showmanual | grep -Ev '\-microcode|firmware-' | wc -l >>"$dfile"
echo '' >>"$dfile"
echo '## List\n' >>"$dfile"
echo '```' >>"$dfile"
apt-mark showmanual | grep -Ev '\-microcode|firmware-' | sort >>"$dfile"
echo '```' >>"$dfile"

echo '# Debian Stable, Other Things\n' >>"$efile"
echo '## Groups\n' >>"$efile"
echo '```' >>"$efile"
id -nG resurtm | tr ' ' '\n' | sort >>"$efile"
echo '```\n' >>"$efile"
echo '## Services & Sockets (`systemd`)\n' >>"$efile"
echo '```' >>"$efile"
{
	systemctl list-unit-files --type=service --state=enabled,indirect --no-legend
	systemctl list-unit-files --type=socket --state=enabled,indirect --no-legend
} | awk '{print $1}' | sort >>"$efile"
echo '```' >>"$efile"
