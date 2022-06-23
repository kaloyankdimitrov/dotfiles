local cmd = vim.cmd
local opt = vim.opt
local indent = 4
-- extra configuration files
require 'plugins'
require 'keybinds'
require 'plugins-config'
require 'theme'
require 'statusline'
opt.termguicolors = true
cmd('colorscheme desert')
opt.compatible = false
-- searching
opt.showmatch = true
opt.ignorecase = true
opt.hlsearch = true
-- indentation
opt.tabstop = indent
opt.softtabstop = indent
opt.shiftwidth = indent
opt.expandtab = false
cmd('filetype indent plugin on')
-- line wrapping
opt.wrap = false
-- line numbers
opt.number = true
opt.relativenumber = true
-- scrolling and mouse
opt.ttyfast = true
opt.mouse = 'a'
-- no swap files or backup
opt.swapfile = false
opt.backup = false
opt.writebackup = false

-- no automatic comment insertion 
cmd('au FileType * set fo-=r fo-=c fo -=o')

-- syntax highlighting
cmd('syntax on')

-- save as sudo hack
vim.cmd([[cnoreabbrev <expr> wr ((getcmdtype() is# ':' && getcmdline() is# 'wr')?('w !sudo tee %'):('wr'))]])
