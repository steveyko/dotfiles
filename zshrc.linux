export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="alanpeabody"
plugins=(vi-mode fzf gh git colored-man-pages zsh-autosuggestions)
ZSH_AUTOSUGGEST_STRATEGY=(history completion)
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=10"
source $ZSH/oh-my-zsh.sh
export EDITOR="/usr/bin/nvim"
ulimit -S -n 262144
source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
export SHELL=$(which zsh)
export TERM=xterm-256color
export PATH=$PATH:$HOME/.local/bin
ulimit -c unlimited # enable core dumps
export CC=$(which clang)
export CXX=$(which clang++)
