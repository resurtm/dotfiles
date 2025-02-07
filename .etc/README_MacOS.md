### Shortcuts and Hotkeys

#### Mission Control

Use these shortcuts to navigate between different spaces:

- Previous space: `Ctrl` + `Command` + `Left Arrow`.
- Next space: `Ctrl` + `Command` + `Right Arrow`.

### brew

```
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

<https://brew.sh/>

### Git/SSH key

```
ssh-keygen -t ed25519 -C "first.last@company.com"
```

<https://docs.github.com/en/authentication/connecting-to-github-with-ssh/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent>

### Alacritty

```
brew install --cask alacritty --no-quarantine
touch ~/.config/alacritty/local.toml
```

Important note on launching it:
[click here](https://github.com/alacritty/alacritty/issues/4673#issuecomment-771291615).

Mac OS specific Alacritty settings can be activated as follows:

```
cp ~/.config/alacritty/local.macos.toml ~/.config/alacritty/local.toml
```

### yadm (Git related)

```
brew install yadm
yadm clone git@github.com:resurtm/dotfiles.git

# yadm specific
yadm gitconfig "user.name" "resurtm"
yadm gitconfig "user.email" "resurtm@gmail.com"
```

- <https://yadm.io/docs/install>
- <https://yadm.io/docs/getting_started>

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

# LFS
brew install git-lfs
```

### VS Code & Jetbrains Toolbox

```
brew install --cask visual-studio-code
brew install --cask jetbrains-toolbox
```

Important note on launching it:

<https://toolbox-support.jetbrains.com/hc/en-us/community/posts/360008186440-Unable-to-login?page=1#community_comment_360002628240>

### Fonts

```
brew tap homebrew/cask-fonts
brew install --cask font-jetbrains-mono-nerd-font
```

### Oh My Zsh (omz)

```
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

<https://ohmyz.sh/#install>

### powerlevel10k omz theme

```
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
```

<https://github.com/romkatv/powerlevel10k?tab=readme-ov-file#oh-my-zsh>

### tmux

```
brew install tmux
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
```

Do not forget to activate and install the plugins:

`Ctrl + B` (the default prefix key) and then `Shift + I` (capitalized `I`).

<https://github.com/tmux-plugins/tpm?tab=readme-ov-file#key-bindings>

### Miscellaneous

```
brew install --cask easy-move-plus-resize
xattr -dr com.apple.quarantine /Applications/Easy\ Move+Resize.app
brew install --cask alt-tab
brew install --cask rectangle

brew install --cask ukelele
brew install --cask anki
brew install --cask postman
brew install --cask gimp
brew install --cask krita
brew install --cask ytmdesktop-youtube-music
brew install MonitorControl

brew install coreutils
brew install topgrade htop fastfetch yazi
brew install gnu-sed upx wget watch tree
```

- Important: <https://github.com/dmarcotte/easy-move-resize/issues/84#issuecomment-1184946746>
- <https://alt-tab-macos.netlify.app/>
- <https://rectangleapp.com/>

### JavaScript

#### NodeJS, npm, and nvm

```
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash
nvm install --lts
nvm use --lts
```

#### Deno

The Deno homepage: https://deno.com

```
curl -fsSL https://deno.land/install.sh | sh
```

<https://github.com/nvm-sh/nvm?tab=readme-ov-file#installing-and-updating>

### NeoVim/LazyVim

```
brew install neovim
brew install ripgrep
brew install lazygit
brew install fd
npm install -g neovim
```

### Mac OS UI specific

- <https://www.reddit.com/r/applehelp/comments/17dmbts/why_cant_i_repeat_keys_by_holding_down_macbook/>
- <https://www.macworld.com/article/351347/how-to-activate-key-repetition-through-the-macos-terminal.html>

### Karabiner Elements

```
brew install --cask karabiner-elements
```

Useful rules to install (or at least consider):

1. `"Home and End"`
2. `"Shift Home and End"`
3. `"Personal rules (@ccmvn)"` -> `"Option+A/O/U to Ä/Ö/Ü (For US keyboard if you want to use German umlauts)"`

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

### Python (base; system-wide)

```
brew install python
python3 --version
pip3 --version

python3 -m venv venv
source ./venv/bin/activate
```

### Python (Anaconda)

Things to consider:

- `brew` usage with `conda` together: <https://stackoverflow.com/a/62179041/571465>
- `conda` installation (from `brew`): <https://gist.github.com/ryanorsinger/7d89ad58901b5590ec3e1f23d7b9f887>

```
brew install --cask anaconda

conda env list
conda create --name my_new_env
conda activate my_new_env
conda env list
```

### Python (+ NeoVim)

1. See this article for the `pynvim` Python package: https://peterbabic.dev/blog/install-pynvim-via-homebrew/
2. See this comment for the `venv-selector` NeoVim plugin: https://github.com/linux-cultist/venv-selector.nvim/issues/117#issuecomment-2266800120

### Rust

```
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
rustup update
rustup component add rust-analyzer
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

**Step 5:** Install Gopls:

```
go install -v golang.org/x/tools/gopls@latest
```

### AWS CLI

```
brew install awscli
```

Follow this guide on how to setup the AWS CLI SSO:
[click here](https://docs.aws.amazon.com/cli/latest/userguide/sso-configure-profile-token.html#sso-configure-profile-token-auto-sso)

### `kubectl`

If you use AWS EKS and `kubectl` just follow this manual/guide:
[click here](https://docs.aws.amazon.com/eks/latest/userguide/install-kubectl.html)

`krew`, `kubens`, `kubectx`:

Install script for `krew`: <https://krew.sigs.k8s.io/docs/user-guide/setup/install/>

```
# check that it's installed correctly
k krew

# install two most important krew plugins
k krew install ctx
k krew install ns

# check two installed plugins
k ctx
k ns
```

# Tilt

<https://docs.tilt.dev/>

```
curl -fsSL https://raw.githubusercontent.com/tilt-dev/tilt/master/scripts/install.sh | bash
```

# Taskfile

<https://taskfile.dev/installation/>

```
brew install go-task/tap/go-task
```

# Databases

## MongoDB

`mongosh` brew package: https://formulae.brew.sh/formula/mongosh

```
brew install mongosh
```
