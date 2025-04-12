#!/bin/bash

# Exit on any error
set -e

echo "🔧 Starting terminal tooling setup..."

# Install Homebrew if not installed
if ! command -v brew &> /dev/null; then
  echo "🍺 Installing Homebrew..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

echo "📦 Installing packages..."

# Essential tools
brew install \
  zsh \
  tmux \
  zoxide \
  bat \
  fzf \
  ripgrep \
  eza \
  thefuck \
  lazygit \
  neovim

# fzf additional setup
"$(brew --prefix)/opt/fzf/install" --all --no-bash --no-fish

# Install Oh My Zsh
if [ ! -d "$HOME/.oh-my-zsh" ]; then
  echo "🎉 Installing Oh My Zsh..."
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi

# Install Powerlevel10k theme
if [ ! -d "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k" ]; then
  echo "✨ Installing Powerlevel10k theme..."
  git clone --depth=1 https://github.com/romkatv/powerlevel10k.git \
    "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k"
fi

# Set zsh as default shell
if [ "$SHELL" != "/bin/zsh" ]; then
  chsh -s /bin/zsh
fi

echo "✅ Setup complete! Start a new terminal session or source your new ~/.zshrc"

