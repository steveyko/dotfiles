#!/bin/bash

OS=$(uname -s | tr '[:upper:]' '[:lower:]')

# Install oh-my-zsh.
pushd .
cd "$HOME"; sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
popd

# Copy .zshrc.
cp zshrc."$OS" "$HOME"/.zshrc
chmod 644 "$HOME"/.zshrc

if [ "$OS" == "linux" ]; then
  # Install zsh-autosuggestions.
  pushd .
  cd "$HOME"/.oh-my-zsh/plugins/; git clone https://github.com/zsh-users/zsh-autosuggestions.git
  popd

  # Copy foot.ini
  mkdir -p "$HOME"/.config/foot
  cp ./foot.ini "$HOME"/.config/foot

  # Copy .fonts
  cp -R fonts "$HOME"/.fonts

  # Copy fish fzf setup
  cp fish_user_key_bindings.fish "$HOME"/.config/fish/functions/

  # Copy fish config
  cp config.fish "$HOME"/.config/fish/

  # Add gh repo.
  curl -fsSL https://cli.github.com/packages/githubcli-archive-keyring.gpg | sudo dd of=/usr/share/keyrings/githubcli-archive-keyring.gpg \
  && sudo chmod go+r /usr/share/keyrings/githubcli-archive-keyring.gpg \
  && echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | sudo tee /etc/apt/sources.list.d/github-cli.list > /dev/null

  # Add neovim repo.
  sudo add-apt-repository ppa:neovim-ppa/unstable -y
  sudo DEBIAN_FRONTEND=noninteractive apt-get update -y

  # Install/uninstall packages.
  sudo DEBIAN_FRONTEND=noninteractive apt install bash-completion btop git neovim lua5.1 acl language-pack-en fzf tmux xclip clang clang-tools clang-tidy clang-format make cmake fortune-mod exa glow gh wcanadian zsh-syntax-highlighting python3-pip cgdb tree shc inotify-tools shellcheck asciinema pv toilet manpages-dev manpages-posix-dev libssl-dev -y
  sudo DEBIAN_FRONTEND=noninteractive apt upgrade -y
elif [ "$OS" == "darwin" ]; then
  # Copy alacritty.yml.
  mkdir -p "$HOME"/.config/alacritty
  cp alacritty.yml "$HOME"/.config/alacritty/

  # Install Homebrew.
  if [ ! -e "/opt/homebrew/bin/brew" ]; then
    (echo; echo 'eval "$(/opt/homebrew/bin/brew shellenv)"') >> "$HOME"/.zprofile
    eval "$(/opt/homebrew/bin/brew shellenv)"
  fi

  # Install packages.
  brew install --cask arc
  brew install --cask alacritty
  brew install --cask mactex-no-gui
  brew install neovim fzf tmux gh zsh-syntax-highlighting zsh-autosuggestions
fi

# Copy .tmux.conf.
cp ./tmux.conf."$OS" "$HOME"/.tmux.conf

# Set up Neovim plugins.
pushd .
mkdir -p "$HOME"/.local/share/nvim/site/pack/plugins/start
cd "$HOME"/.local/share/nvim/site/pack/plugins/start
git clone https://github.com/dense-analysis/ale.git
git clone https://github.com/Yggdroot/indentLine.git
git clone https://github.com/itchyny/lightline.vim.git
git clone https://github.com/mengelbrecht/lightline-bufferline.git
git clone https://github.com/maximbaz/lightline-ale.git
git clone https://github.com/preservim/nerdcommenter.git
git clone https://github.com/neovim/nvim-lspconfig.git
git clone https://github.com/nvim-tree/nvim-tree.lua.git
git clone https://github.com/luochen1990/rainbow.git
git clone https://github.com/frankier/neovim-colors-solarized-truecolor-only.git
git clone https://github.com/bfrg/vim-cpp-modern.git
git clone https://github.com/machakann/vim-highlightedyank.git
git clone https://github.com/justinmk/vim-sneak.git
git clone https://github.com/nvim-tree/nvim-web-devicons.git
git clone https://github.com/github/copilot.vim.git
popd

# Copy Neovim config files (init.vim and config.lua).
mkdir -p "$HOME"/.config/nvim/lua
cp ./init.vim."$OS" "$HOME"/.config/nvim/
cp ./config.lua."$OS" "$HOME"/.config/nvim/lua/

# Copy a customized solarized theme for lightline with the right permissions.
cp ./solarizedmine.vim "$HOME"/.local/share/nvim/site/pack/plugins/start/lightline.vim/autoload/lightline/colorscheme/
