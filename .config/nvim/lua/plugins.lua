return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    use {
	    'nvim-tree/nvim-tree.lua',
	    requires = {
	    	'nvim-tree/nvim-web-devicons',
	    }
    }

    use {
	    'nvim-telescope/telescope.nvim',
	    tag = '0.1.x',
	    requires = { {'nvim-lua/plenary.nvim'} }
    }

    use 'lukas-reineke/indent-blankline.nvim'
    use "nvim-lua/popup.nvim"
    use 'folke/tokyonight.nvim'

    use {
        "folke/trouble.nvim",
        requires = "kyazdani42/nvim-web-devicons",
        config = function()
            require("trouble").setup()
        end
    }

    use {
    	'nvim-treesitter/nvim-treesitter',
    	run = ':TSUpdate'
    }

    use {
        'akinsho/bufferline.nvim',
        tag = "v3.*",
        requires = 'kyazdani42/nvim-web-devicons'
    }

    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'kyazdani42/nvim-web-devicons', opt = true }
    }

    use {
        "akinsho/toggleterm.nvim",
        tag = '*',
        config = function()
            require("toggleterm").setup()
        end
    }

    -- lsp
    use "neovim/nvim-lspconfig"
    use "hrsh7th/cmp-nvim-lsp"

    -- CMP
    use "hrsh7th/cmp-buffer"
    use "hrsh7th/cmp-path"
    use "hrsh7th/cmp-cmdline"
    use "hrsh7th/nvim-cmp"

    -- snippets
    use {"L3MON4D3/LuaSnip", tag = "v<CurrentMajor>.*"}
    use "saadparwaiz1/cmp_luasnip"
    use "rafamadriz/friendly-snippets"

    use {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
    }

    -- autocomplete
    use {
        'saecki/crates.nvim',
        tag = 'v0.3.0',
        requires = { 'nvim-lua/plenary.nvim' },
        config = function()
            require('crates').setup()
        end,
    }

    -- Debug
     use 'mfussenegger/nvim-dap'
end)
