-- NERD Tree
-- Start NERDTree unless a file or session is specified
vim.cmd([[
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists('s:std_in') && v:this_session == '' | NERDTree | wincmd p | endif]])

-- Exit Vim if NERDTree is the only window remaining in the only tab.
vim.cmd("autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif")

-- Close the tab if NERDTree is the only window remaining in it.
vim.cmd("autocmd BufEnter * if winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif")

-- If another buffer tries to replace NERDTree, put it in the other window, and bring back NERDTree.
vim.cmd('autocmd BufEnter * if bufname("#") =~ "NERD_tree_d+" && bufname("%") !~ "NERD_tree_d+" && winnr("$") > 1 | let buf=bufnr() | buffer# | execute "normal! <C-W>w" | execute "buffer".buf | endif')

-- Remove status Line
-- vim.g.NERDTreeStatusline = '%#NonText#'

-- Delete buffer if file is deleted
vim.g.NERDTreeAutoDeleteBuffer = true

-- Andrew's NERDTree
vim.g.andrews_nerdtree_buffer_fs_menu = true
vim.g.andrews_nerdtree_git_filter = true
vim.g.andrews_nerdtree_interactive_edit = true

-- NERD Commenter
vim.g.NERDCreateDefaultMappings = false
vim.g.NERDSpaceDelims = true
vim.g.NERDCompactSexyComs = true
vim.g.NERDCommentEmptyLines = true
vim.g.NERDTrimTailingWhitespace = true

-- LSP
-- Setup nvim-cmp.
local cmp = require'cmp'

cmp.setup({
	snippet = {
      expand = function(args)
		require('luasnip').lsp_expand(args.body)
      end,
    },
	mapping = {
	  ['<C-d>'] = cmp.mapping.scroll_docs(-4),
	  ['<C-f>'] = cmp.mapping.scroll_docs(4),
	  ['<C-Space>'] = cmp.mapping.complete(),
	  ['<C-e>'] = cmp.mapping.close(),
	  ['<CR>'] = cmp.mapping.confirm({ select = true }),
	  ['<Tab>'] = cmp.mapping(cmp.mapping.select_next_item(), { 'i', 's' }),
	  ['<S-Tab>'] = cmp.mapping(cmp.mapping.select_prev_item(), { 'i', 's' })
	},
	sources = {
	  { name = 'nvim_lsp' },
	  { name = 'luasnip' },
	  { name = 'buffer' },
	}
})

local lsp = require 'lspconfig'
local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
lsp.clangd.setup {
	capabilities = capabilities,
	cmd = {
		"clangd",
		"--background-index",
		"--suggest-missing-includes",
	},
	filetypes = {"c", "cpp", "objc", "objcpp"},
}

