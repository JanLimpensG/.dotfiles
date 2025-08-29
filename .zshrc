HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt sharehistory
setopt appendhistory
setopt hist_ignore_all_dups
setopt hist_save_no_dups

bindkey -v
bindkey -s ^f "tmux-sessionizer\n"

alias vim='nvim'
export PATH="$HOME/.local/bin:$PATH"
export PATH="/usr/local/go/bin:$PATH"
export PATH="$HOME/go/bin:$PATH"

ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"

if [ ! -d "$ZINIT_HOME" ]; then
	mkdir -p "$(dirname $ZINIT_HOME)"
	git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi

source "${ZINIT_HOME}/zinit.zsh"

zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions

autoload -U compinit && compinit

eval "$($HOME/.local/bin/oh-my-posh init zsh --config $HOME/.config/oh-my-posh/base.toml)"
