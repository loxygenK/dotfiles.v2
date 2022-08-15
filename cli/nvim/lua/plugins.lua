return require("packer").startup(function(use)
    --=== Infrastructure ===--
    use "wbthomason/packer.nvim"

    use {"junegunn/fzf", run = ":call fzf#install()" }
    use "junegunn/fzf.vim"

    use "obaland/vfiler.vim"
    use "obaland/vfiler-column-devicons"
    use "obaland/vfiler-fzf"

    --=== Appearances ===--
    use "ayu-theme/ayu-vim"
    use {
        "nvim-lualine/lualine.nvim",
        requires = { 'kyazdani42/nvim-web-devicons', opt = true }
    }

    ---=== Developer Experiences ===--
    use "williamboman/nvim-lsp-installer"
    use "neovim/nvim-lspconfig"

    use "hrsh7th/nvim-cmp"
    use "hrsh7th/cmp-nvim-lsp"
    use "saadparwaiz1/cmp_luasnip"

    use 'L3MON4D3/LuaSnip'
    use 'rafamadriz/friendly-snippets'

    --- Format code using prettier
    use {
        'MunifTanjim/prettier.nvim',
        requires = {
            'jose-elias-alvarez/null-ls.nvim',
            'nvim-lua/plenary.nvim'
        }
    }
    use {
        'glepnir/lspsaga.nvim',
        branch = 'main'
    }
end)
