local installer = require("nvim-lsp-installer")
local lspconfig = require("lspconfig")
installer.setup {}

local on_attach = function(client, bufnr)
    local function map(key, execute, raw)
        local rhs_text = execute;
        if raw == true then
            rhs_text = "<cmd>lua " .. rhs_text .. "()<CR>"
        end
        vim.api.nvim_buf_set_keymap(bufnr, "n", key, rhs_text, {})
    end

    vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")

    map("gD", "vim.lsp.buf.declaration")
    map("gd", "vim.lsp.buf.definition")
    map("gi", "vim.lsp.buf.implementation")
    map("gr", "vim.lsp.buf.references\n")
    -- map("<Space>ca", "vim.lsp.buf.code_action")
end

local capabilities = require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol.make_client_capabilities())
local default = {
    on_attach = on_attach,
    capabilities = capabilities,
}

local additional = {
    sumneko_lua = {
        settings = {
            Lua = {
                diagnostics = {
                    globals = { 'vim' }
                }
            }
        }
    }
}

for _, s in pairs(installer.get_installed_servers()) do
    local name = s["name"]
    local config = vim.deepcopy(default)
    local server_config = additional[name]

    if server_config ~= nil then
        config = vim.tbl_extend("force", config, server_config)
    end

    lspconfig[name].setup(config)
end

