typeset -A ZSH_HIGHLIGHT_STYLES

orange=208

ZSH_HIGHLIGHT_STYLES[unknown-token]="fg=red"
ZSH_HIGHLIGHT_STYLES[reserved-word]="fg=$orange"
ZSH_HIGHLIGHT_STYLES[alias]="fg=cyan"
ZSH_HIGHLIGHT_STYLES[builtin]="fg=magenta"
ZSH_HIGHLIGHT_STYLES[function]="fg=cyan"
ZSH_HIGHLIGHT_STYLES[command]="fg=cyan"

ZSH_HIGHLIGHT_STYLES[single-quoted-argument]="fg=green"
ZSH_HIGHLIGHT_STYLES[double-quoted-argument]="fg=green"
ZSH_HIGHLIGHT_STYLES[dollar-quoted-argument]="fg=$orange"
ZSH_HIGHLIGHT_STYLES[dollar-double-quoted-argument]="fg=$orange"
ZSH_HIGHLIGHT_STYLES[single-quoted-argument-unclosed]="fg=gray"
ZSH_HIGHLIGHT_STYLES[double-quoted-argument-unclosed]="fg=greay"
ZSH_HIGHLIGHT_STYLES[dollar-quoted-argument-unclosed]="fg=greay"

ZSH_HIGHLIGHT_STYLES[back-double-quoted-argument]="fg=178"
ZSH_HIGHLIGHT_STYLES[back-dollar-quoted-argument]="fg=178"

unset orange
