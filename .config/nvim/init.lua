-- [[ Install package manager ]] -> `:help lazy.nvim.txt`
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system {
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable', -- latest stable release
    lazypath,
  }
end
vim.opt.rtp:prepend(lazypath)

require('lazy').setup({
  -- 'rmehri01/onenord.nvim',
  -- 'sam4llis/nvim-tundra',
  -- 'frenzyexists/aquarium-vim',
  -- 'kvrohit/mellow.nvim',

  'tjdevries/colorbuddy.nvim',

  '2nthony/vitesse.nvim',
  dependencies = {
    'tjdevries/colorbuddy.nvim'
  },

  'jwalton512/vim-blade',

  -- Git
  'tpope/vim-fugitive',
  'tpope/vim-rhubarb',
  'posva/vim-vue',

  -- Detect tabstop and shiftwidth automatically
  'tpope/vim-sleuth',

  {
    -- LSP Configuration & Plugins
    'neovim/nvim-lspconfig',
    dependencies = {
      -- Automatically install LSPs to stdpath for neovim
      { 'williamboman/mason.nvim', config = true },
      'williamboman/mason-lspconfig.nvim',

      -- Useful status updates for LSP
      -- NOTE: `opts = {}` is the same as calling `require('fidget').setup({})`
      { 'j-hui/fidget.nvim',       opts = {} },

      -- Additional lua configuration, makes nvim stuff amazing!
      'folke/neodev.nvim',
    },
    config = require('plugins.autoformat')
  },
  {
    -- Autocompletion
    'hrsh7th/nvim-cmp',
    dependencies = {
      -- Snippet Engine & its associated nvim-cmp source
      'L3MON4D3/LuaSnip',
      'saadparwaiz1/cmp_luasnip',

      -- Adds LSP completion capabilities
      'hrsh7th/cmp-nvim-lsp',

      -- Adds a number of user-friendly snippets
      'rafamadriz/friendly-snippets',
    },
  },

  -- Show pending keybinds
  { 'folke/which-key.nvim',          opts = {} },
  {
    -- Adds git releated signs to the gutter, as well as utilities for managing changes
    'lewis6991/gitsigns.nvim',
    opts = {
      -- See `:help gitsigns.txt`
      signs = {
        add = { text = '+' },
        change = { text = '~' },
        delete = { text = '_' },
        topdelete = { text = '‾' },
        changedelete = { text = '~' },
      },
      -- on_attach = keymaps.on_attach_gitsigns
    },
  },
  {
    -- Set lualine as statusline
    'nvim-lualine/lualine.nvim',
    -- See `:help lualine.txt`
    opts = {
      options = {
        icons_enabled = false,
        -- theme = 'onenord',
        component_separators = '|',
        section_separators = '',
      },
    },
  },
  {
    "nvim-tree/nvim-tree.lua",
    version = "*",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
    config = function()
      require("nvim-tree").setup(require('plugins.nvim-tree'))
    end,
  },

  -- {
  --   -- Add indentation guides even on blank lines
  --   'lukas-reineke/indent-blankline.nvim',
  --   main = 'ibl',
  --   -- Enable `lukas-reineke/indent-blankline.nvim`
  --   -- See `:help indent_blankline.txt`
  --   opts = {},
  -- },

  -- "gc" to comment visual regions/lines
  { 'numToStr/Comment.nvim',         opts = {} },
  { 'christoomey/vim-tmux-navigator' },

  -- Fuzzy Finder (files, lsp, etc)
  {
    'nvim-telescope/telescope.nvim',
    branch = '0.1.x',
    dependencies = { 'nvim-lua/plenary.nvim' },
    lazy = false
  },
  {
    'nvim-telescope/telescope-fzf-native.nvim',
    build = 'make',
    cond = function()
      return vim.fn.executable 'make' == 1
    end,
  },
  {
    'nvim-treesitter/nvim-treesitter',
    dependencies = {
      'nvim-treesitter/nvim-treesitter-textobjects',
    },
    build = ':TSUpdate',
  },
  { 'ThePrimeagen/harpoon' },
  { "windwp/nvim-ts-autotag", dependencies = { 'nvim-treesitter' } },
  {
    'mfussenegger/nvim-dap',
    dependencies = {
      'rcarriga/nvim-dap-ui',
      'williamboman/mason.nvim',
      'jay-babu/mason-nvim-dap.nvim',
      'leoluz/nvim-dap-go',
    },
    config = require('plugins.debug')
  },
  {
    'windwp/nvim-autopairs',
    dependencies = { 'hrsh7th/nvim-cmp' },
    config = require('plugins.autopairs'),
  },
  {
    'phpactor/phpactor',
    ft = { 'php' }
  },
}, {})

local keymaps = require 'core.keymaps'
require 'core.vim_settings'

-- [[ CONFIGURE PLUGINS ]] --

-- Telescope -> `:help telescope` and `:help telescope.setup()`
require('plugins.telescope')

-- Enable telescope fzf native, if installed
pcall(require('telescope').load_extension, 'fzf')

require('plugins.treesitter')
require('plugins.lsp')

-- Nvim-cmp -> `:help cmp`
require('plugins.cmp')
