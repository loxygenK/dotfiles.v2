### Software Configuration
# Apply configurations from arguments
alias bat="bat --theme='ansi' --style='numbers,grid'"
alias exa="exa --icons"

# Overriding existing commands by other tools
alias ls="exa"
alias cat="bat"
alias tree="exa --tree"
alias vim="nvim"

### Shortcutting
# I prefer using abbreviation to see what will the shortcut be expanded.
alias abbr="abbr --session --quiet --force"

# Launching very frequently used programs
abbr v="nvim"
abbr l="ls"
abbr L="ls -al"
abbr y="yarn"
abbr p="pnpm"

# Shortcutting Git commands
abbr gs="git status -bs"
abbr gd="git diff"
abbr gds="git diff --staged"

# Shortcutting LS commands
abbr la="ls -al"

unalias abbr
