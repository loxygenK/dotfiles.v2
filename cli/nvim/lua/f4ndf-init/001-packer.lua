-- Used the function provided in the following answer in Stackoverflow:
-- https://stackoverflow.com/a/15434737
function isModuleAvailable(name)
  if package.loaded[name] then
    return true
  else
    for _, searcher in ipairs(package.searchers or package.loaders) do
      local loader = searcher(name)
      if type(loader) == 'function' then
        package.preload[name] = loader
        return true
      end
    end
    return false
  end
end

if not isModuleAvailable("packer") then
    print("[!!] Packer is not available!")
    print("We will install Packer from GitHub.")

    local confirmed = vim.fn["input"]("Confirm? [yN]: ")

    if string.lower(confirmed) ~= "y" then
        print(" ... Canceled! Aborting with error.")
        error("Essential plugin manager 'packer' is not installed, and the user aborted installation.")
    end

    os.execute("git clone --depth 1 https://github.com/wbthomason/packer.nvim ~/.local/share/nvim/site/pack/packer/start/packer.nvim")
end

require("plugins");

local packer = require("packer");
packer.install();
