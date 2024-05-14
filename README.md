# `resurtm`'s dotfiles and everything related

## Arch Linux

TBD

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

* The original [`Neovim` installation manual is available here](https://github.com/neovim/neovim/blob/master/INSTALL.md#ubuntu).
* [The `fastfetch` documentation is here](https://github.com/fastfetch-cli/fastfetch?tab=readme-ov-file#linux).

## MS Windows 11 _(including WSL2)_

Coding / engineering software / tools:

* [Alacritty](https://github.com/alacritty/alacritty/releases)
* [WezTerm](https://wezfurlong.org/wezterm/install/windows.html)

Necessary system-wide fonts:

[The download page is here](https://www.nerdfonts.com/font-downloads).

* `Iosevka Nerd Font`
* `JetBrainsMono Nerd Font`

Usual / everyday / desktop software:

* [Telegram](https://desktop.telegram.org/)
* [WhatsApp Desktop](https://www.whatsapp.com/download?lang=de_DE)
* [Skype](https://www.skype.com/de/get-skype/)

## Mac OS

### brew

```
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

https://brew.sh/

### Git/SSH key

```
ssh-keygen -t ed25519 -C "first.last@company.com"
```

https://docs.github.com/en/authentication/connecting-to-github-with-ssh/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent

### Alacritty

```
brew install --cask alacritty --no-quarantine
touch ~/.config/alacritty/local.toml
```

Important note on launching it:
[click here](https://github.com/alacritty/alacritty/issues/4673#issuecomment-771291615).

Mac OS usually needs bigger fonts for Alacritty. Content of the `~/.config/alacritty/local.toml` file should be:

```
[font]
size = 14.5
```

### yadm (Git related)

```
brew install yadm
yadm clone git@github.com:resurtm/dotfiles.git

# yadm specific
yadm gitconfig "user.name" "resurtm"
yadm gitconfig "user.email" "resurtm@gmail.com"
```

* https://yadm.io/docs/install
* https://yadm.io/docs/getting_started

### Git (general)

```
# workplace/job specific
git config --global "user.name" "First Last"
git config --global "user.email" "first.last@company.com"

# personal/private specific (set for every personal private, don't use `--global`)
git config "user.name" "resurtm"
git config "user.email" "resurtm@gmail.com"

# yadm specific
yadm gitconfig "user.name" "resurtm"
yadm gitconfig "user.email" "resurtm@gmail.com"
```

### VS Code & Jetbrains Toolbox

```
brew install --cask visual-studio-code
brew install --cask jetbrains-toolbox
```

Important note on launching it:

https://toolbox-support.jetbrains.com/hc/en-us/community/posts/360008186440-Unable-to-login?page=1#community_comment_360002628240

### Fonts

```
brew tap homebrew/cask-fonts
brew install --cask font-jetbrains-mono-nerd-font
```

### Oh My Zsh (omz)

```
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

https://ohmyz.sh/#install

### powerlevel10k omz theme

```
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
```

https://github.com/romkatv/powerlevel10k?tab=readme-ov-file#oh-my-zsh

### tmux

```
brew install tmux
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
```

Do not forget to activate and install the plugins:

`Ctrl + B` (the default prefix key) and then `Shift + I` (capitalized `I`).

https://github.com/tmux-plugins/tpm?tab=readme-ov-file#key-bindings

### Miscellaneous

```
brew install --cask easy-move-plus-resize
xattr -dr com.apple.quarantine /Applications/Easy\ Move+Resize.app
brew install --cask alt-tab
brew install --cask rectangle

brew install fastfetch
brew install htop
brew install topgrade

brew install spotify
brew install --cask ukelele
brew install --cask anki
brew install --cask postman
```

* Important: https://github.com/dmarcotte/easy-move-resize/issues/84#issuecomment-1184946746
* https://alt-tab-macos.netlify.app/
* https://rectangleapp.com/

### NodeJS, npm, and nvm

```
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash
nvm install --lts
nvm use --lts
```

https://github.com/nvm-sh/nvm?tab=readme-ov-file#installing-and-updating

### NeoVim/LazyVim

```
brew install neovim
brew install ripgrep
brew install lazygit
brew install fd
npm install -g neovim
```

### Mac OS UI specific

* https://www.reddit.com/r/applehelp/comments/17dmbts/why_cant_i_repeat_keys_by_holding_down_macbook/
* https://www.macworld.com/article/351347/how-to-activate-key-repetition-through-the-macos-terminal.html

### Karabiner Elements

```
brew install --cask karabiner-elements
```

Useful rules to install (or at least consider):

1. `"Home and End"`
2. `"Shift Home and End"`

### Docker

```
brew install --cask docker
# Important: open the Docker application in the Mac OS UI (i.e. Docker Desktop)

docker version
docker run hello-world

docker compose version

# maybe needed? the new Docker version already has the Docker Compose built-in
# brew install docker-compose
# docker compose version
```

### Python

```
brew install python
python3 --version
pip3 --version

python3 -m venv venv
source ./venv/bin/activate
```

### Rust

```
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
rustup update
```

### Golang

**Step 1:** [Mac OS X Requirements](https://github.com/moovweb/gvm?tab=readme-ov-file#mac-os-x-requirements):

```
xcode-select --install
brew update
brew install mercurial
```

**Step 2:** [Installing](https://github.com/moovweb/gvm?tab=readme-ov-file#installing)

```
bash < <(curl -s -S -L https://raw.githubusercontent.com/moovweb/gvm/master/binscripts/gvm-installer)
```

**Step 3:** ["An important note on installation"](https://github.com/moovweb/gvm/issues/385#issuecomment-1030190550):

```
brew install go && gvm install go1.22.3 && gvm use go1.22.3 --default && brew uninstall go
```

**Step 4:** Check that everything is good:

```
go version
```
