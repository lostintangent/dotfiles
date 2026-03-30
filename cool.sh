#!/usr/bin/env zsh
# 😎 cool.sh — a collection of handy shell utilities

# ------------------------------------------------------------------ #
#  Greeting                                                           #
# ------------------------------------------------------------------ #
echo ""
echo "  ██████╗ ██████╗  ██████╗ ██╗     "
echo "  ██╔════╝██╔═══██╗██╔═══██╗██║     "
echo "  ██║     ██║   ██║██║   ██║██║     "
echo "  ██║     ██║   ██║██║   ██║██║     "
echo "  ╚██████╗╚██████╔╝╚██████╔╝███████╗"
echo "   ╚═════╝ ╚═════╝  ╚═════╝ ╚══════╝"
echo ""
echo "  Welcome back, $(whoami)! 🚀  $(date '+%A, %B %-d %Y')"
echo ""

# ------------------------------------------------------------------ #
#  Aliases                                                            #
# ------------------------------------------------------------------ #

# Navigation
alias ..="cd .."
alias ...="cd ../.."
alias ~="cd ~"

# List with color + human-readable sizes
alias ll="ls -lAh --color=auto"
alias la="ls -A --color=auto"

# Safety nets
alias rm="rm -i"
alias cp="cp -i"
alias mv="mv -i"

# Git shortcuts
alias gs="git status -sb"
alias gl="git log --oneline --graph --decorate --all -20"
alias gd="git diff"
alias gp="git push"
alias gpl="git pull --rebase"

# Network
alias myip="curl -s https://api.ipify.org && echo"
alias ports="lsof -i -P -n | grep LISTEN"

# ------------------------------------------------------------------ #
#  Functions                                                          #
# ------------------------------------------------------------------ #

# mkcd — make a directory and immediately cd into it
mkcd() { mkdir -p "$1" && cd "$1"; }

# weather — quick weather report for a city (default: current location)
weather() { curl -s "wttr.in/${1:-}?1"; }

# extract — unpack any common archive format
extract() {
  if [[ -f "$1" ]]; then
    case "$1" in
      *.tar.bz2) tar xjf "$1" ;;
      *.tar.gz)  tar xzf "$1" ;;
      *.tar.xz)  tar xJf "$1" ;;
      *.bz2)     bunzip2 "$1" ;;
      *.gz)      gunzip  "$1" ;;
      *.tar)     tar xf  "$1" ;;
      *.tbz2)    tar xjf "$1" ;;
      *.tgz)     tar xzf "$1" ;;
      *.zip)     unzip   "$1" ;;
      *.Z)       uncompress "$1" ;;
      *.7z)      7z x    "$1" ;;
      *)         echo "'$1' cannot be extracted via extract()" ;;
    esac
  else
    echo "'$1' is not a valid file"
  fi
}

# timeit — time a command and print the result
timeit() { time "$@"; }

# note — quickly jot a note into ~/notes.txt
note() {
  local notes_file="$HOME/notes.txt"
  if [[ $# -eq 0 ]]; then
    cat "$notes_file" 2>/dev/null || echo "(no notes yet)"
  else
    echo "$(date '+%Y-%m-%d %H:%M')  $*" >> "$notes_file"
    echo "✅ Note saved."
  fi
}
