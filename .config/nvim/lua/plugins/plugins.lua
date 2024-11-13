return {

    {
	"neovim/nvim-lspconfig",
	dependencies = {
	    "williamboman/mason.nvim",
	},
	config = require("plugins.configs.cmp")
    },

    {
	"hrsh7th/nvim-cmp",
	dependencies = {
	    "hrsh7th/cmp-nvim-lsp",  -- LSP source for nvim-cmp
        },
	config = require("plugins.configs.lspconfig")
    },

    {
	"echasnovski/mini.pairs",
	opts = {},
    },

    {
        "nvim-telescope/telescope.nvim",
        tag = "0.1.8",
        dependencies = {
            "nvim-lua/plenary.nvim"
        },
        lazy = false,
        config = require("plugins.configs.telescope")
    },

    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate"
    },

    {
        "lewis6991/gitsigns.nvim",
        event = { "BufReadPost", "BufNewFile", "BufWritePost" },
        opts = function()
            require("plugins.configs.gitsigns")
        end,
    },

    {
	"tpope/vim-fugitive",
        cmd = { "G", "Git", "Gdiffsplit", "Gread", "Gwrite", "Ggrep", "GMove", "GDelete", "GBrowse" },
    },

    {
        "ThePrimeagen/harpoon"
    }
}
