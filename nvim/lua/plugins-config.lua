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
-- nvim-tree
require('nvim-tree').setup({	
	on_attach = function(bufnr)
		local api = require('nvim-tree.api')
		local function opts(desc)
			return { desc = 'nvim-tree: ' .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true  }
		end
		-- default mappings
		api.config.mappings.default_on_attach(bufnr)
		-- custom mappings
		vim.keymap.set('n', '<C-[>', api.tree.change_root_to_parent, opts('Up'))
	end
})
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.api.nvim_create_autocmd("BufEnter", {
  group = vim.api.nvim_create_augroup("NvimTreeClose", {clear = true}),
  pattern = "NvimTree_*",
  callback = function()
    local layout = vim.api.nvim_call_function("winlayout", {})
    if layout[1] == "leaf" and vim.api.nvim_buf_get_option(vim.api.nvim_win_get_buf(layout[2]), "filetype") == "NvimTree" and layout[3] == nil then vim.cmd("confirm quit") end
  end
})

-- NERD Commenter
vim.g.NERDCreateDefaultMappings = false
vim.g.NERDSpaceDelims = true
vim.g.NERDCompactSexyComs = true
vim.g.NERDCommentEmptyLines = true
vim.g.NERDTrimTailingWhitespace = true

-- LaTex
vim.g.neotex_enable = 2
-- LazyGit
vim.g.lazygit_floating_window_winblend = 0 -- transparency of floating window
vim.g.lazygit_floating_window_scaling_factor = 0.9 -- scaling factor for floating window
vim.g.lazygit_floating_window_border_chars = {'╭', '╮', '╰', '╯'} -- customize lazygit popup window corner characters
vim.glazygit_floating_window_use_plenary = 1 -- use plenary.nvim to manage floating window if available

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

local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
local lsp = require 'lspconfig'
local protocol = require 'vim.lsp.protocol'

local on_attach = function(client, buffer)
	local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
	local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

	-- Mappings
	local opts = { noremap = true, silent = true }

	-- Format on save
	if client.supports_method("textDocument/formatting") then
		vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
		vim.api.nvim_create_autocmd("BufWritePre", {
			group = augroup,
			buffer = bufnr,
			callback = function()
				vim.lsp.buf.format()
			end,
		})
	end
end

local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())

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
lsp.arduino_language_server.setup {
	on_attach = on_attach,
	capabilities = capabilities,
	cmd = {
		'arduino-language-server',
		'-cli-config', '$HOME/.arduino15/arduino-cli.yaml',
		'-fqbn', 'arduino:avr:uno'
	}
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
lsp.hls.setup {
	on_attach = on_attach,
	capabilities = capabilities
}
lsp.texlab.setup {
	on_attach = on_attach,
	capabilities = capabilities
}
lsp.pylsp.setup {
	on_attach = on_attach,
	capabilities = capabilities
}
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
