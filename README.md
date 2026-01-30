# 💠 lostintangent's dotfiles

This repository contains my personal shell configuration files, scripts, and re-usable agent skills/commands.

## 📦 What's Included

- **`.zshrc`** - Zsh shell configuration with:
  - Git-aware prompt
  - Auto-completion settings
  - ZSH plugins support (autosuggestions, syntax highlighting)
  - Development tool configurations (fnm, bun, omnara)
  
- **`.gitconfig`** - Git configuration with:
  - User information
  - GitHub credential helpers
  - Useful aliases for common Git commands
  - Better diff and log formatting
  
- **`.oshen_floor`** - Environment configuration for Oshen
  
- **`.gitignore`** - Global gitignore patterns

## 🚀 Installation

### Prerequisites

The following tools are recommended for full functionality:

- [Homebrew](https://brew.sh/) (macOS package manager)
- [Zsh](https://www.zsh.org/) (should be default on macOS)
- [Git](https://git-scm.com/)
- [GitHub CLI](https://cli.github.com/) (`gh`)

### Optional Dependencies

- [zsh-autosuggestions](https://github.com/zsh-users/zsh-autosuggestions)
  ```bash
  brew install zsh-autosuggestions
  ```
  
- [zsh-syntax-highlighting](https://github.com/zsh-users/zsh-syntax-highlighting)
  ```bash
  brew install zsh-syntax-highlighting
  ```
  
- [fnm](https://github.com/Schniz/fnm) (Fast Node Manager)
  ```bash
  brew install fnm
  ```

### Quick Setup

1. **Clone this repository:**
   ```bash
   git clone https://github.com/lostintangent/dotfiles.git ~/dotfiles
   cd ~/dotfiles
   ```

2. **Backup existing dotfiles (if any):**
   ```bash
   mv ~/.zshrc ~/.zshrc.backup 2>/dev/null || true
   mv ~/.gitconfig ~/.gitconfig.backup 2>/dev/null || true
   ```

3. **Create symlinks:**
   ```bash
   ln -sf ~/dotfiles/.zshrc ~/.zshrc
   ln -sf ~/dotfiles/.gitconfig ~/.gitconfig
   ln -sf ~/dotfiles/.gitignore ~/.gitignore_global
   ```

4. **Reload your shell:**
   ```bash
   source ~/.zshrc
   ```

## 🎨 Features

### Git Aliases

The `.gitconfig` includes many useful aliases:

- `git st` - Short status
- `git s` - Short status with branch info
- `git lg` - Beautiful log graph
- `git lga` - Log graph for all branches
- `git undo` - Undo last commit (keeps changes)
- `git unstage` - Unstage files
- `git aliases` - List all available aliases

### Zsh Prompt

The prompt shows:
- Current directory (in cyan)
- Git branch name (in magenta, when in a Git repository)
- Git status indicators

## 📝 Customization

Feel free to fork this repository and customize the dotfiles to your needs. The configuration files include comments explaining each section.

## 🤝 Contributing

Suggestions and improvements are welcome! Feel free to open an issue or pull request.

## 📄 License

These dotfiles are available for anyone to use and modify as they see fit.
