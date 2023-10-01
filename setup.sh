#!/bin/bash

# Copy foot.ini
mkdir -p $HOME/.config/foot
cp ./foot.ini $HOME/.config/foot

# Copy .tmux.conf.
cp ./tmux.conf $HOME/.tmux.conf

# Copy .fonts
cp -R fonts $HOME/.fonts

# Set up Neovim plugins.
pushd .
mkdir -p $HOME/.local/share/nvim/site/pack/plugins/start
cd $HOME/.local/share/nvim/site/pack/plugins/start; git clone --depth=1 https://github.com/dense-analysis/ale.git; git clone --depth=1 https://github.com/Yggdroot/indentLine.git; git clone --depth=1 https://github.com/itchyny/lightline.vim.git; git clone --depth=1 https://github.com/mengelbrecht/lightline-bufferline.git; git clone --depth=1 https://github.com/maximbaz/lightline-ale.git; git clone --depth=1 https://github.com/preservim/nerdcommenter.git; git clone --depth=1 https://github.com/neovim/nvim-lspconfig.git; git clone --depth=1 https://github.com/nvim-tree/nvim-tree.lua.git; git clone --depth=1 https://github.com/luochen1990/rainbow.git; git clone --depth=1 https://github.com/frankier/neovim-colors-solarized-truecolor-only.git; git clone --depth=1 https://github.com/bfrg/vim-cpp-modern.git; git clone --depth=1 https://github.com/machakann/vim-highlightedyank.git; git clone --depth=1 https://github.com/justinmk/vim-sneak.git; git clone --depth=1 https://github.com/nvim-tree/nvim-web-devicons.git
popd

# Copy Neovim config files (init.vim and config.lua).
mkdir -p $HOME/.config/nvim/lua
cp ./init.vim $HOME/.config/nvim/
cp ./config.lua $HOME/.config/nvim/lua/

# Copy a customized solarized theme for lightline with the right permissions.
cp ./solarizedmine.vim $HOME/.local/share/nvim/site/pack/plugins/start/lightline.vim/autoload/lightline/colorscheme/

# Copy fish fzf setup
cp fish_user_key_bindings.fish $HOME/.config/fish/functions/
