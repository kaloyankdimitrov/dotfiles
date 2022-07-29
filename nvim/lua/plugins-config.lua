-- Startify
vim.g.startify_commands = {
	{ pi = { 'Install Plugins', ':PlugInstall' } },
	{ pu = { 'Update Plugins', ':PlugUpdate' } },
	{ pc = { 'Clean Plugins', ':PlugClean' } },
	{ pv = { 'Update vim-plug', ':PlugUpgrade' } }
}
vim.g.startify_bookmarks = {
	{ ww = '~/Dropbox/VimWiki/index.md' },
	{ df = '~/dotfiles' }
}
vim.g.startify_lists = { 
	{ type = 'dir', header = { 'Recently edited files in '..vim.fn.getcwd()..':' } }, 
	{ type = 'files', header = { 'Files' } },
	{ type = 'commands', header = { 'Commands' } },
	{ type = 'bookmarks', header = { 'Bookmarks' } } 
}
-- custom header
vim.g.startify_custom_header = {
	'	*----------------------------------------------------*',
	'	|  "I have not failed.                               |',
	'	|   I have just found 10,000 ways that won\'t work."  |',
	'	|                              -- Thomas A. Edison   |',
	'	*----------------------------------------------------*'
}
-- don't change working dir
vim.g.startify_change_to_dir = 0
vim.g.startify_change_to_vcs_root = 1
-- NERD Tree
-- Exit Vim if NERDTree is the only window remaining in the only tab.
vim.cmd("autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif")

-- Close the tab if NERDTree is the only window remaining in it.
vim.cmd("autocmd BufEnter * if winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif")

-- If another buffer tries to replace NERDTree, put it in the other window, and bring back NERDTree.
vim.cmd('autocmd BufEnter * if bufname("#") =~ "NERD_tree_d+" && bufname("%") !~ "NERD_tree_d+" && winnr("$") > 1 | let buf=bufnr() | buffer# | execute "normal! <C-W>w" | execute "buffer".buf | endif')

-- Remove status Line
vim.g.NERDTreeStatusline = '%#NonText#'

-- Delete buffer if file is deleted
vim.g.NERDTreeAutoDeleteBuffer = true
-- Make it prettier
vim.g.NERDTreeMinimalUI = true
-- Show hidden files
vim.g.NERDTreeShowHidden = true

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

-- LaTex
vim.g.neotex_enable = 2

-- LSP
-- Cmp
local cmp = require'cmp'

cmp.setup({
	snippet = {
		expand = function(args)
			require('luasnip').lsp_expand(args.body)
		end
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
	  { name = 'buffer' },
	  { name = 'luasnip' },
	}
})

local lsp = require 'lspconfig'
local protocol = require 'vim.lsp.protocol'
local on_attach = function(client, buffer)
	local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
	local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

	-- Mappings
	local opts = { noremap = true, silent = true }

	-- Format on save
	if client.resolved_capabilities.document_formatting then
		vim.api.nvim_command [[augroup Format]]
		vim.api.nvim_command [[autocmd! * <buffer>]]
		vim.api.nvim_command [[autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_seq_sync()]]
		vim.api.nvim_command [[augroup END]]
	end
end

local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics, {
    underline = true,
    -- This sets the spacing and the prefix
    virtual_text = {
      spacing = 2,
      prefix = ''
    }
  }
)

lsp.ccls.setup {
	on_attach = on_attach,
	capabilities = capabilities
}
lsp.html.setup {
	on_attach = on_attach,
	capabilities = capabilities
}
lsp.tsserver.setup {
	on_attach = on_attach,
	capabilities = capabilities
}
lsp.jsonls.setup {
	on_attach = on_attach,
	capabilities = capabilities
}
lsp.hls.setup{}
lsp.texlab.setup {
	on_attach = on_attach,
	capabilities = capabilities
}
lsp.pyright.setup{}
lsp.rust_analyzer.setup{
	on_attach = on_attach,
	capabilities = capabilities
}
local null_ls = require'null-ls'
null_ls.setup({
	sources = {
		null_ls.builtins.diagnostics.eslint_d,
		null_ls.builtins.diagnostics.eslint,
		null_ls.builtins.formatting.prettier,
		null_ls.builtins.formatting.prettierd
	}
})

-- Telescope
local action_layout = require("telescope.actions.layout")
require'telescope'.setup {
	defaults = {	
		layout_strategy = 'flex',
		layout_config = { 
			width = 0.95, 
			height = 0.95,
			vertical = {
				preview_cutoff = 1				
			}
		},
		file_previewer = require'telescope.previewers'.vim_buffer_cat.new,
		grep_previewer = require'telescope.previewers'.vim_buffer_vimgrep.new,	
		mappings = {
			i = {
				['?'] = action_layout.toggle_preview,
			},
			n = {
				['?'] = action_layout.toggle_preview,
			}
		}
	}
}

-- VimWiki
vim.g.vimwiki_list = {
	{
		path = '~/vimwiki', 
		syntax = 'markdown', 
		ext = '.md'
	}
}
vim.g.vimwiki_markdown_link_ext = 1
vim.g.taskwiki_markup_syntax = 'markdown'
vim.g.markdown_folding = 1
