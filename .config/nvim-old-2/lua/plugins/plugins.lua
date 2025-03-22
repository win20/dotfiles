return {
	{
		"neovim/nvim-lspconfig",
		lazy = false,
		dependencies = {
			"williamboman/mason.nvim",
		},
		config = require("plugins.configs.cmp"),
	},

	{
		"hrsh7th/nvim-cmp",
		lazy = false,
		dependencies = {
			"hrsh7th/cmp-nvim-lsp", -- LSP source for nvim-cmp
		},
		config = require("plugins.configs.lspconfig"),
	},

	{
		"echasnovski/mini.pairs",
		opts = {},
	},

	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.8",
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
		lazy = false,
		config = require("plugins.configs.telescope"),
	},

	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		config = require("plugins.configs.treesitter"),
	},

	{
		"lewis6991/gitsigns.nvim",
		event = { "BufReadPost", "BufNewFile", "BufWritePost" },
		opts = function()
			require("plugins.configs.gitsigns")
		end,
	},

	{
		"ThePrimeagen/harpoon",
	},

	{
		"stevearc/oil.nvim",
		---@module 'oil'
		---@type oil.SetupOpts
		opts = {},
		-- Optional dependencies
		dependencies = { { "echasnovski/mini.icons", opts = {} } },
		-- dependencies = { "nvim-tree/nvim-web-devicons" }, -- use if prefer nvim-web-devicons
		config = require("plugins.configs.oil"),
	},

	{
		"prettier/vim-prettier",
	},

	{
		"nvimtools/none-ls.nvim",
		event = { "BufReadPre", "BufNewFile" },
		dependencies = { "nvimtools/none-ls-extras.nvim" },
		lazy = false,
		config = require("plugins.configs.none-ls"),
	},

	{
		"NeogitOrg/neogit",
		dependencies = {
			"nvim-lua/plenary.nvim", -- required
			"sindrets/diffview.nvim", -- optional - Diff integration

			-- Only one of these is needed.
			"nvim-telescope/telescope.nvim", -- optional
		},
		config = true,
	},

	-- {
	-- 	    "dgox16/oldworld.nvim",
	--    lazy = false,
	--    priority = 1000,
	-- }
	--
	{
		"RRethy/base16-nvim",
		lazy = false,
		priority = 1000,
	}
}
