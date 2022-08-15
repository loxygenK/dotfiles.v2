local saga = require("lspsaga")
local action = require("lspsaga.action")

local function map(key, func)
    print(func)
    vim.keymap.set("n", key, ":lua " .. func .. "()<CR>")
end

local function with_saga(sub_package, func)
    return "require('lspsaga." .. sub_package .. "')." .. func
end

saga.init_lsp_saga({
    code_action_lightbulb = {
        enable = true,
        sign = true,
        enable_in_insert = true,
        sign_priority = 20,
        virtual_text = true
    }
})

map("<Space>ca", with_saga("codeaction", "code_action"))

vim.keymap.set("n", "gd", ":Lspsaga preview_definition<CR>")
vim.keymap.set("n", "K", ":Lspsaga hover_doc<CR>")

vim.keymap.set("n", "<C-j>", function() action.smart_scroll_with_saga(1) end)
vim.keymap.set("n", "<C-k>", function() action.smart_scroll_with_saga(-1) end)
