# --- Configure the history behavior.
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000

# --- Configure Zsh behavior.

# == changing directory
# Automatically push the directory to the directory stack on `cd`.
setopt auto_pushd

# == Globbing
# If the filename generation globbing is bad, refuses and emit error
setopt bad_pattern

# == Completion
# Automatically add '/' when the directory was completed
setopt auto_param_slash

# Complete filename even the options and path are connected with '='.
setopt magic_equal_subst

# == History
# Prevent duplicating the history
setopt hist_ignore_all_dups

# Once edit the history rather than executing the line
setopt hist_verify

setopt extendedglob nomatch

# == Others
# Use Vim-like binding.
bindkey -v

# --- Initialization

# == compinit
zstyle :compinstall filename '/home/flisan/.zshrc'

autoload -Uz compinit
compinit
