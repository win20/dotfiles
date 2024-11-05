return {
    {
	"neovim/nvim-lspconfig",
	dependencies = {
	    "williamboman/mason.nvim",
	},
	config = require("plugins.configs.lsp")
    },

    {
	"hrsh7th/nvim-cmp",
	dependencies = {
	    "hrsh7th/cmp-nvim-lsp",  -- LSP source for nvim-cmp
        },
	config = require("plugins.configs.autocompletion")
    },

    {
	"echasnovski/mini.pairs",
	opts = {},
    },
}

