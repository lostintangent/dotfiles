# ============================================
# ZSH Configuration
# ============================================

# Enable completion system
autoload -Uz compinit
compinit

# Completion styling
zstyle ':completion:*' menu select
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'
zstyle ':completion:*' list-colors 'di=34'

# ============================================
# Prompt Configuration
# ============================================

# Git-aware prompt with vcs_info
autoload -Uz vcs_info
precmd() { vcs_info }

# Configure vcs_info for git
zstyle ':vcs_info:*' enable git
zstyle ':vcs_info:git:*' formats ' (%b)'
zstyle ':vcs_info:git:*' actionformats ' (%b|%a)'

# Set prompt with git branch
setopt prompt_subst
PROMPT='%F{cyan}%~%f%F{magenta}${vcs_info_msg_0_}%f $ '

# ============================================
# ZSH Plugins
# ============================================

# Enable zsh-autosuggestions (if installed)
if [[ -f /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh ]]; then
  source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh
fi

# Enable zsh-syntax-highlighting (if installed)
if [[ -f /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]]; then
  source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
fi

# ============================================
# Development Tools
# ============================================

# fnm (Fast Node Manager)
if command -v fnm &> /dev/null; then
  eval "$(fnm env)"
fi

# Bun completions
if [[ -s "$HOME/.bun/_bun" ]]; then
  source "$HOME/.bun/_bun"
fi

# Bun environment
export BUN_INSTALL="$HOME/.bun"
if [[ -d "$BUN_INSTALL/bin" ]]; then
  export PATH="$BUN_INSTALL/bin:$PATH"
fi

# Omnara environment
export OMNARA_INSTALL="$HOME/.omnara"
if [[ -d "$OMNARA_INSTALL/bin" ]]; then
  export PATH="$OMNARA_INSTALL/bin:$PATH"
fi
