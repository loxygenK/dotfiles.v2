let base = "#CC5A71"

highlight Comment ctermfg=243

highlight Constant ctermfg=204
highlight Identifier ctermfg=168
highlight Type ctermfg=66

highlight LineNR ctermfg=240

highlight Statement ctermfg=30
highlight Special ctermfg=32

highlight CursorLine cterm=NONE
highlight CursorColumn ctermbg=NONE

highlight Pmenu ctermbg=225
highlight PmenuSel ctermbg=219

highlight VertSplit ctermbg=240 ctermfg=7

function! SynStack()
    if !exists("*synstack")
        return
    endif
    echo map(synstack(line("."), col(".")), 'synIDattr(v:val, "name")')
endfunc
