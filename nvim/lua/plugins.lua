local Plug = vim.fn['plug#']
vim.call 'plug#begin'
Plug 'nvim-lua/plenary.nvim'
Plug 'mhinz/vim-startify'
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-surround'
Plug 'kdheepak/lazygit.nvim'
Plug 'preservim/nerdcommenter'
Plug 'AndrewRadev/andrews_nerdtree.vim'
Plug 'preservim/nerdtree'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'ryanoasis/vim-devicons'
Plug('donRaphaco/neotex', {['for'] = 'tex'})
Plug 'neovim/nvim-lspconfig'
Plug 'jose-elias-alvarez/null-ls.nvim'
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'L3MON4D3/LuaSnip'
Plug 'saadparwaiz1/cmp_luasnip'
Plug('nvim-telescope/telescope.nvim', {['tag'] = '0.1.0' })
Plug 'ThePrimeagen/harpoon'
Plug 'vimwiki/vimwiki'
vim.call 'plug#end'
