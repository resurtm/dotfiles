# MS Windows (10 + 11)

## General Things

```
# https://scoop.sh/
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
Invoke-RestMethod -Uri https://get.scoop.sh | Invoke-Expression

scoop install git
scoop bucket add extras
scoop install ytmdesktop
```

## Ubuntu LTS _(including MS Windows 11 WSL2)_

```
sudo apt update && sudo apt full-upgrade
sudo apt install \
  zsh tmux yadm youtube-dl

# neovim
sudo add-apt-repository ppa:neovim-ppa/unstable \
  && sudo apt update \
  && sudo apt install neovim

# fastfetch
sudo add-apt-repository ppa:zhangsongcui3371/fastfetch \
  && sudo apt update \
  && sudo apt install fastfetch
```

Several notes:

- The original [`Neovim` installation manual is available here](https://github.com/neovim/neovim/blob/master/INSTALL.md#ubuntu).
- [The `fastfetch` documentation is here](https://github.com/fastfetch-cli/fastfetch?tab=readme-ov-file#linux).

### Zellij

- Zellij: https://github.com/zellij-org/zellij
- Theme: https://github.com/scottmckendry/cyberdream.nvim/tree/main/extras/zellij
- Zellij + Neovim (tmux mode): https://shoukoo.github.io/blog/zellij-love-neovim/

```
# local bin (which is in PATH)
cd ~/bin

# download the latest version from here:
# https://github.com/zellij-org/zellij/releases

# unpack
tar -xvf zellij*.tar.gz
rm zellij*.tar.gz

# execute
chmod +x zellij
zellij

# themes
mkdir -p ~/.config/zellij/themes
cd ~/.config/zellij/themes
wget https://raw.githubusercontent.com/scottmckendry/cyberdream.nvim/refs/heads/main/extras/zellij/cyberdream.kdl
wget https://raw.githubusercontent.com/scottmckendry/cyberdream.nvim/refs/heads/main/extras/zellij/cyberdream-light.kdl
```

## MS Windows 11 _(including WSL2)_

Coding / engineering software / tools:

- [Alacritty](https://github.com/alacritty/alacritty/releases)
- [WezTerm](https://wezfurlong.org/wezterm/install/windows.html)

Necessary system-wide fonts:

[The download page is here](https://www.nerdfonts.com/font-downloads).

- `Iosevka Nerd Font`
- `JetBrainsMono Nerd Font`

Usual / everyday / desktop software:

- [WhatsApp Desktop](https://www.whatsapp.com/download?lang=de_DE)
- [Skype](https://www.skype.com/de/get-skype/)
