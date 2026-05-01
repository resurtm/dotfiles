#!/usr/bin/env sh
set -euo pipefail

dir="${HOME}/.etc/debian"
ffile="${dir}/flatpak.md"
dfile="${dir}/deb-apt.md"

rm -f -- "$ffile" "$dfile"
mkdir -p -- "$dir"

echo "# Debian Stable, Flatpak\n\n## List\n\n\`\`\`" >>"$ffile"
flatpak list --app --columns=name,application | sort >>"$ffile"
echo "\`\`\`" >>"$ffile"

echo "# Debian Stable, \`dpkg\`/\`apt\`\n\n## List\n\n\`\`\`" >>"$dfile"
apt-mark showmanual | sort >>"$dfile"
echo "\`\`\`\n\n## \`sources.list\`\n\n\`\`\`" >>"$dfile"
cat /etc/apt/sources.list >>"$dfile"
echo "\`\`\`" >>"$dfile"
