#!/usr/bin/env sh

dir="${HOME}/.etc/void"
ffile="${dir}/flatpak.md"
xfile="${dir}/xbps.md"

rm -f -- "$ffile" "$xfile"
mkdir -p -- "$dir"

echo "# Void Flatpak\n\n## List\n\n\`\`\`" >>"$ffile"
flatpak list --app --columns=name,application | sed '1d' | sort >>"$ffile"
echo "\`\`\`" >>"$ffile"

echo "# Void XBPS\n\n## List\n\n\`\`\`" >>"$xfile"
xpkg -m | sort >>"$xfile"
echo "\`\`\`\n\n## Ignored\n\n\`\`\`" >>"$xfile"
cat /etc/xbps.d/ignorepkg.conf | sort >>"$xfile"
echo "\`\`\`" >>"$xfile"
