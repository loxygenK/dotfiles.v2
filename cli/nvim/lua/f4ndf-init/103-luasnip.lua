-- Snippets are provided by `rafamadriz/friendly-snippets`

vim.cmd [[ highlight SnippetChoicing ctermfg=3 ]]
vim.cmd [[ highlight SnippetInserting ctermfg=245 guifg=#aaaaaa ]]

local types = require("luasnip.util.types")
require("luasnip").config.setup {
    ext_opts = {
        [types.choiceNode] = {
            active = {
                virt_text = {{"🪄", "SnippetChoicing"}}
            }
        },
        [types.insertNode] = {
            active = {
                virt_text = {{"🪄 Snippet is active - <Tab> to switch", "SnippetInserting"}}
            }
        },
    }
}
require("luasnip.loaders.from_vscode").lazy_load()
