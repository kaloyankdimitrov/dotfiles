-- splits separator
vim.opt.fillchars = 'vert: '

-- colors
local highlight = vim.api.nvim_set_hl
highlight(0, 'Normal', { fg='#ffffff' })
highlight(0, 'NormalFloat', { fg='#ffffff' })
highlight(0, 'NonText', { fg='#00ffff' })
highlight(0, 'LineNr', { fg='#f7ef70' })
highlight(0, 'String', { fg='#f7ef70' })
highlight(0, 'VertSplit', { fg='#ffffff' })
highlight(0, 'Type', { fg='#e31c25' })
highlight(0, 'StatusLine', { fg='#f7ef70' })
highlight(0, 'StatusLineNC', { fg='#f7ef70' })
highlight(0, 'MsgArea', { fg='#f7ef70' })
highlight(0, 'Pmenu', { fg='#ffffff', bg='#680101' })
highlight(0, 'PmenuSel', { fg='#ffffff', bg='#e31c25' })
highlight(0, 'PmenuSbar', { fg='#ffffff', bg='#e31c25' })
highlight(0, 'Folded', { fg='#ffffff', bg='#e31c25' })
highlight(0, 'FoldedColumn', { fg='#ffffff', bg='#e31c25' })
highlight(0, 'SignColumn', { fg='#ffffff' })
highlight(0, 'LspDiagnosticsDefaultError', { fg='#e31c25' })
highlight(0, 'CmpItemAbbrDefault', { fg='#ffffff' })
highlight(0, 'CmpItemAbbrDeprecatedDefault', { fg='#ffffff' })

