local cmd = vim.cmd
local opt = vim.opt
local wo = vim.wo
local g = vim.g
local s = vim.s

local INDENT = 4

g.mapleader = " "

opt.backspace = { "eol", "start", "indent" } -- allow backspacing over everything in insert mode
opt.clipboard = "unnamedplus"                -- allow neovim to access the system clipboard
vim.opt.fileencoding = "utf-8"               -- the encoding written to a file
opt.encoding = "utf-8"                       -- the encoding
opt.matchpairs = { "(:)", "{:}", "[:]", "<:>" }
opt.syntax = "enable"

wo.relativenumber = true

-- Indentation --
opt.autoindent = false
opt.expandtab = false
opt.shiftwidth = INDENT
opt.smartindent = true
opt.softtabstop = INDENT
opt.tabstop = INDENT
opt.shiftround = true

-- Search --
opt.hlsearch = true
opt.ignorecase = true
opt.smartcase = true
-- opt.wildignore = opt.wildignore + { "*/node_modules/*", "*/.git/*", "*/vendor/*" }
-- opt.wildmenu = true   -- make tab completion for files/buffers act like bash

-- UI --
opt.cursorline = true
opt.laststatus = 2
opt.lazyredraw = true
opt.list = true
opt.listchars = {
	tab = "┊ ",
	trail = "·",
	extends = "»",
	precedes = "«",
	nbsp = "×",
}

opt.cmdheight = 0
