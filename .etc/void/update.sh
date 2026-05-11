#!/usr/bin/env bash
set -euo pipefail

dir="${HOME}/.etc/void"
ffile="${dir}/flatpak.md"
xfile="${dir}/xbps.md"
efile="${dir}/etc.md"

rm -f -- "$ffile" "$xfile" "$efile"
mkdir -p -- "$dir"

echo '# Void Flatpak' >>"$ffile"
echo '## List' >>"$ffile"
echo '```' >>"$ffile"
flatpak list --app --columns=name,application | sort >>"$ffile"
echo '```' >>"$ffile"

echo '# Void XBPS' >>"$xfile"
echo '## List' >>"$xfile"
echo '```' >>"$xfile"
xpkg -m | sort >>"$xfile"
echo '```' >>"$xfile"
echo '## Ignored' >>"$xfile"
echo '```' >>"$xfile"
cat /etc/xbps.d/ignorepkg.conf | sort >>"$xfile"
echo '```' >>"$xfile"

echo '# Other things' >>"$efile"
echo '## Groups' >>"$efile"
echo '```' >>"$efile"
groups resurtm >>"$efile"
echo '```' >>"$efile"
echo '## Runit' >>"$efile"
echo '```' >>"$efile"
ls /var/service/ | sort >>"$efile"
echo '```' >>"$efile"
