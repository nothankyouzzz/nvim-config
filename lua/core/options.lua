-- setting indent
local INDENT = 2
vim.opt.expandtab = true
vim.opt.shiftwidth = INDENT
vim.opt.tabstop = INDENT
vim.opt.softtabstop = INDENT

-- ui
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.termguicolors = true
vim.opt.cursorline = true
vim.opt.wrap = false
vim.opt.pumheight = 8

vim.opt.mouse = 'a'

vim.g.mapleader = ' '

vim.opt.clipboard = "unnamedplus"
vim.opt.completeopt = { 'menuone', 'noselect' }
vim.opt.ignorecase = true
vim.opt.fileencoding = "utf-8"
vim.opt.showmode = false
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.scrolloff = 8
vim.opt.sidescrolloff = 8
vim.opt.updatetime = 100
vim.opt.undofile = true
vim.opt.writebackup = false
vim.opt.swapfile = false
