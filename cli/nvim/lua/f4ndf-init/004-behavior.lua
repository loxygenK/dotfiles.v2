if vim.fn.has("mouse") == 1 then
    vim.o.mouse = "a"
end

-- Shows line nubmer
vim.o.number = true

-- Use 4-characeters space indent
vim.o.shiftwidth = 4
vim.o.tabstop = 4
vim.o.expandtab = true

--- Show where the cursor is
vim.o.cursorline = true
vim.o.cursorcolumn = true
