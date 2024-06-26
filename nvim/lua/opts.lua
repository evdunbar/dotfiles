local opt = vim.opt

-- Context
opt.number = true
opt.relativenumber = true
opt.scrolloff = 4
opt.showmode = false

-- Filetypes
opt.encoding = "utf8"
opt.fileencoding = "utf8"

-- Theme
opt.syntax = "ON"
opt.termguicolors = true

-- Search
opt.ignorecase = true
opt.smartcase = true

-- Whitespace
opt.expandtab = true
opt.shiftwidth = 4
opt.softtabstop = 4
opt.tabstop = 4

-- Cmp
opt.completeopt = { "menu", "menuone", "noselect" }
