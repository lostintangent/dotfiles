#!/usr/bin/env bash

# Dotfiles Installation Script
# This script sets up symlinks for dotfiles in the user's home directory

set -e

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Get the directory where this script is located
DOTFILES_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

echo -e "${GREEN}╔═══════════════════════════════════════╗${NC}"
echo -e "${GREEN}║   Dotfiles Installation Script       ║${NC}"
echo -e "${GREEN}╚═══════════════════════════════════════╝${NC}"
echo ""

# Function to create a symlink with backup
create_symlink() {
  local source="$1"
  local target="$2"
  
  # If target exists and is not a symlink, back it up
  if [ -e "$target" ] && [ ! -L "$target" ]; then
    echo -e "${YELLOW}⚠ Backing up existing $target to ${target}.backup${NC}"
    mv "$target" "${target}.backup"
  fi
  
  # Remove existing symlink if it exists
  if [ -L "$target" ]; then
    rm "$target"
  fi
  
  # Create the symlink
  echo -e "${GREEN}✓ Linking $source -> $target${NC}"
  ln -sf "$source" "$target"
}

# Main installation
echo "Installing dotfiles from: $DOTFILES_DIR"
echo ""

# Create symlinks for dotfiles
create_symlink "$DOTFILES_DIR/.zshrc" "$HOME/.zshrc"
create_symlink "$DOTFILES_DIR/.gitconfig" "$HOME/.gitconfig"
create_symlink "$DOTFILES_DIR/.gitignore" "$HOME/.gitignore_global"

# Note: .oshen_floor is specific to Oshen environment, only link if user wants it
if [ -f "$DOTFILES_DIR/.oshen_floor" ]; then
  echo ""
  read -p "Do you want to install .oshen_floor (Oshen environment config)? [y/N] " -n 1 -r
  echo ""
  if [[ $REPLY =~ ^[Yy]$ ]]; then
    create_symlink "$DOTFILES_DIR/.oshen_floor" "$HOME/.oshen_floor"
  fi
fi

echo ""
echo -e "${GREEN}✓ Installation complete!${NC}"
echo ""

# Check for optional dependencies
echo "Checking optional dependencies..."
echo ""

check_command() {
  if command -v "$1" &> /dev/null; then
    echo -e "${GREEN}✓ $1 is installed${NC}"
    return 0
  else
    echo -e "${YELLOW}⚠ $1 is not installed${NC}"
    return 1
  fi
}

check_brew_package() {
  if ! command -v brew &> /dev/null; then
    return 1
  fi
  
  if brew list "$1" &> /dev/null 2>&1; then
    echo -e "${GREEN}✓ $1 is installed${NC}"
    return 0
  else
    echo -e "${YELLOW}⚠ $1 is not installed (brew install $1)${NC}"
    return 1
  fi
}

check_command "brew"
check_command "git"
check_command "gh"
check_command "fnm"

if command -v brew &> /dev/null; then
  check_brew_package "zsh-autosuggestions"
  check_brew_package "zsh-syntax-highlighting"
fi

echo ""
echo -e "${GREEN}╔═══════════════════════════════════════╗${NC}"
echo -e "${GREEN}║   Next Steps                          ║${NC}"
echo -e "${GREEN}╚═══════════════════════════════════════╝${NC}"
echo ""
echo "1. Reload your shell configuration:"
echo -e "   ${YELLOW}source ~/.zshrc${NC}"
echo ""
echo "2. Install optional dependencies if needed (see above)"
echo ""
echo -e "${GREEN}Enjoy your new dotfiles! 🎉${NC}"
