-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

vim.g.mapleader = " "
vim.g.snacks_animate = false
vim.g.autoformat = false -- 保存时自动格式化


local opt = vim.opt

opt.cursorline = true --  当前行高亮

opt.spell = false
opt.spelllang = {}
opt.number = true
opt.relativenumber = true

-- tabs & indentation
opt.autoindent = true
opt.tabstop = 2
opt.shiftwidth = 2
opt.expandtab = true

opt.wrap = false

-- search settings
opt.ignorecase = true
opt.smartcase = true

-- tokeynigth
opt.termguicolors = true
opt.signcolumn = "yes"
opt.background = "dark"

-- backspace
opt.backspace = "indent,eol,start"

-- clipboard
opt.clipboard = vim.env.SSH_TTY and "" or "unnamedplus" -- Sync with system clipboard

-- split windows
opt.splitright = true
opt.splitbelow = true




