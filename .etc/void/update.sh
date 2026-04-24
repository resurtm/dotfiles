#!/usr/bin/env sh

dir="${HOME}/.etc/void"
ffile="${dir}/flatpak.md"
xfile="${dir}/xbps.md"
efile="${dir}/etc.md"

rm -f -- "$ffile" "$xfile" "$efile"
mkdir -p -- "$dir"

echo "# Void Flatpak\n\n## List\n\n\`\`\`" >>"$ffile"
flatpak list --app --columns=name,application | sed '1d' | sort >>"$ffile"
echo "\`\`\`" >>"$ffile"

echo "# Void XBPS\n\n## List\n\n\`\`\`" >>"$xfile"
xpkg -m | sort >>"$xfile"
echo "\`\`\`\n\n## Ignored\n\n\`\`\`" >>"$xfile"
cat /etc/xbps.d/ignorepkg.conf | sort >>"$xfile"
echo "\`\`\`" >>"$xfile"

echo "# Other things\n\n## Groups\n\n\`\`\`" >>"$efile"
groups resurtm >>"$efile"
echo "\`\`\`\n\n## Runit\n\n\`\`\`" >>"$efile"
ls /var/service/ | sort >>"$efile"
echo "\`\`\`" >>"$efile"
