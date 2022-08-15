local dirs = vim.split(vim.fn.glob("~/.config/nvim/lua/f4ndf-init/*.lua"), "\n");

for k, v in pairs(dirs) do
    if(v == "") then
        goto continue;
    end
    if(string.find(v, "init.lua")) then
        -- The initialize file itself
        goto continue;
    end

    vim.cmd("source " .. v) --(string.gsub(v, ".lua", ""));

    ::continue::
end
