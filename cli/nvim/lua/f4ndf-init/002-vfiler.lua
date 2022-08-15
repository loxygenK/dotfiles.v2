local fzf_action = require("vfiler/fzf/action")
local action = require("vfiler/action")
local config = require("vfiler/config")

config.clear_mappings()
config.setup {
    options = {
        keep = true,
        layout = "left",
        name = "VFiler",
        width = 30,
        columns = "indent,devicons,name"
    },
    mappings = {
        ["h"] = action.close_tree_or_cd,
        ["l"] = action.open_tree,
        ["L"] = action.open_tree_recursive,
        ["H"] = action.change_to_parent,
        ["<Space>"] = action.toggle_select,
        ["<CR>"] = action.open,
        ["n"] = action.new_file,
        ["N"] = action.new_directory,
        ["m"] = action.move,
        ["c"] = action.copy,
        ["p"] = action.paste,
        ["d"] = action.delete,
        ["r"] = action.rename,
        ["P"] = action.toggle_auto_preview,
        ["f"] = fzf_action.files,
        ["g"] = fzf_action.grep
    }
}

function startup_vfiler()
    if vim.g.f4n_vfiler_sup_called then
        return
    end

    vim.g.f4n_vfiler_sup_called = true;
    require("vfiler").start();
end


vim.api.nvim_create_autocmd("BufEnter", {
    pattern = { "*" },
    callback = startup_vfiler
});
