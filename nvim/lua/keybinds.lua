utils = require('utils')

-- map leader
utils.map('n', '<Space>', '')
utils.map('x', '<Space>', '')
vim.g.mapleader = ' '

-- move line up or down
utils.map('i', '<A-j>', '<Esc>:m .+1<CR>==gi')
utils.map('i', '<A-k>', '<Esc>:m .-2<CR>==gi')
utils.map('v', '<A-j>', ':m >+1<CR>gv==gv')
utils.map('v', '<A-j>', ':m <-2<CR>gv==gv')

-- move between panes
utils.map('n', '<A-h>', '<C-W>h')
utils.map('n', '<A-j>', '<C-W>j')
utils.map('n', '<A-k>', '<C-W>k')
utils.map('n', '<A-l>', '<C-W>l')

-- move panes
utils.map('n', '<C-A-h>', '<C-W>H')
utils.map('n', '<C-A-j>', '<C-W>J')
utils.map('n', '<C-A-k>', '<C-W>K')
utils.map('n', '<C-A-l>', '<C-W>L')

-- create panes
-- vertical
utils.map('n', '<A-v>', '<C-W>v<C-W>l')
-- horizontal
utils.map('n', '<A-c>', '<C-W>S<C-W>j')

-- copy filepath to clipboard
utils.map('n', 'yf', ':let @+=expand("%:p")<CR>', {silent = true})
-- copy pwd to clipboard
utils.map('n', 'yd', ':let @+=expand("%:p:h")<CR>', { silent = true})

-- Startify
utils.map('n', '<leader>st', ':Startify<CR>', {silent = true})
-- NERDTree
utils.map('n', '<leader>tt', ':NERDTreeToggle<CR>', {silent = true})
utils.map('n', '<leader>tf', ':NERDTreeFind<CR>', {silent = true})

-- NERD Commenter
utils.map('n', '<leader>cc', '<plug>NERDCommenterToggle', {noremap = false, silent = true})
utils.map('x', '<leader>cc', '<plug>NERDCommenterToggle', {noremap = false, silent = true})
utils.map('n', '<leader>cs', '<plug>NERDCommenterSexy', {noremap = false, silent = true})
utils.map('x', '<leader>cs', '<plug>NERDCommenterSexy', {noremap = false, silent = true})
utils.map('n', '<leader>cu', '<plug>NERDCommenterUncomment', {noremap = false, silent = true})
utils.map('x', '<leader>cu', '<plug>NERDCommenterUncomment', {noremap = false, silent = true})

-- FZF
utils.map('n', '<leader>ff', ':Files<CR>', { silent = true })
utils.map('n', '<leader>fg', ':GFiles<CR>', { silent = true })
utils.map('n', '<leader>fb', ':Buffers<CR>', { silent = true })
utils.map('n', '<leader>fr', ':Rg ')

-- LSP
-- Show floating diagnostics
utils.map('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', {noremap = false, silent = true})
utils.map('n', 'D', '<cmd>lua vim.lsp.buf.hover()<CR>', {noremap = false, silent = true})
utils.map('n', 'fd', '<cmd>lua vim.diagnostic.open_float()<CR>', {noremap = false, silent = true})
utils.map('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>', {noremap = false, silent = true})
utils.map('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<CR>', {noremap = false, silent = true})
