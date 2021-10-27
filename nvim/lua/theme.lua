-- splits separator
vim.opt.fillchars = 'vert: '

-- colors
vim.cmd([[
au VimEnter * hi Normal guifg=#ffffff guibg=NONE gui=NONE
au VimEnter * hi NonText guifg=#00ffff guibg=NONE gui=NONE
au VimEnter * hi LineNr guifg=#00ffff guibg=NONE gui=NONE
au VimEnter * hi CursorLineNr guifg=#f7ef70 guibg=NONE gui=NONE
au VimEnter * hi String guifg=#f7ef70
au VimEnter * hi Comment guifg=#aa0000
au VimEnter * hi VertSplit guifg=#ffffff guibg=NONE gui=NONE
au VimEnter * hi Type guifg=#e31c25
au VimEnter * hi StatusLine guifg=#00ffff guibg=NONE gui=NONE
au VimEnter * hi StatusLineNC guifg=#00aaaa guibg=NONE gui=NONE
au VimEnter * hi MsgArea guifg=#00ffff guibg=NONE gui=NONE
au VimEnter * hi Pmenu guifg=#ffffff guibg=#680101
au VimEnter * hi PmenuSel guifg=#ffffff guibg=#e31c25
au VimEnter * hi PmenuSbar guifg=#ffffff guibg=#e31c25
au VimEnter * hi Folded guifg=#ffffff guibg=#e31c25
au VimEnter * hi FoldedColumn guifg=#ffffff guibg=#e31c25
au VimEnter * hi SignColumn guifg=#ffffff guibg=NONE
au VimEnter * hi LspDiagnosticsDefaultError guifg=#e31c25 guibg=NONE
au VimEnter * hi CmpItemAbbrDefault guifg=#ffffff guibg=NONE
au VimEnter * hi CmpItemAbbrDeprecatedDefault guifg=#ffffff guibg=NONE
]])

