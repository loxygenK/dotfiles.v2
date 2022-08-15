require("null-ls").setup {
    on_attach = function(client, bufnr)
        if client.server_capabilities.documentRangeFormattingProvider then
            vim.keymap.set("n", "<Leader>f", ":lua vim.lsp.buf.range_formatting({})<CR>")
        end
    end
}

vim.keymap.set("n", "<Leader>f", ":lua vim.lsp.buf.formatting()<CR>")

require("prettier").setup {
    bin = "prettier"
}
