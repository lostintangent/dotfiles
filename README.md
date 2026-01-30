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

### Automated Setup (Recommended)

1. **Clone this repository:**
   ```bash
   git clone https://github.com/lostintangent/dotfiles.git ~/dotfiles
   cd ~/dotfiles
   ```

2. **Run the installation script:**
   ```bash
   ./install.sh
   ```
   
   The script will:
   - Automatically backup any existing dotfiles
   - Create symlinks to your home directory
   - Check for optional dependencies
   - Provide next steps

3. **Reload your shell:**
   ```bash
   source ~/.zshrc
   ```

### Manual Setup (Alternative)

If you prefer to set up manually or need to customize the installation:

1. Clone the repository (as above)
2. Create symlinks for the files you want:
   ```bash
   ln -sf ~/dotfiles/.zshrc ~/.zshrc
   ln -sf ~/dotfiles/.gitconfig ~/.gitconfig
   ln -sf ~/dotfiles/.gitignore ~/.gitignore_global
   # Note: .oshen_floor is specific to Oshen environment
   ```
3. Reload your shell: `source ~/.zshrc`

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
