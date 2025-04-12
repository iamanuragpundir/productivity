# Path to Oh My Zsh installation
export ZSH="$HOME/.oh-my-zsh"

# Theme
ZSH_THEME="powerlevel10k/powerlevel10k"

# Plugins
plugins=(git z zoxide fzf thefuck)

source $ZSH/oh-my-zsh.sh

# Aliases
alias ll='eza -al --color=always --group-directories-first'
alias la='eza -a'
alias l='eza'
alias cat='bat'
alias grep='rg'
alias vim='nvim'

# zoxide init
eval "$(zoxide init zsh)"

# fzf config (optional enhancements)
export FZF_DEFAULT_COMMAND='rg --files --hidden --glob "!.git/*"'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

# Enable thefuck
eval "$(thefuck --alias)"

# TMUX auto-start
if command -v tmux &> /dev/null && [ -z "$TMUX" ]; then
  tmux attach -t default || tmux new -s default
fi

# Set default editor
export EDITOR='nvim'

# Powerlevel10k config (generate with `p10k configure`)
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Add Homebrew to path if needed
eval "$(/opt/homebrew/bin/brew shellenv)"

