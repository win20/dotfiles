local wo = vim.wo
local g = vim.g
local opt = vim.opt
local indent_width = 4

g.mapleader = " "
g.maplocalleader = "\\"

wo.relativenumber = true

opt.autoindent = true
opt.expandtab = true
opt.shiftwidth = indent_width
opt.smartindent = true

vim.o.digraph = false

