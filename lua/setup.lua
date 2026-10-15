local NoobDir = require('noobdir')
local NoobTerm = require('noobterm')

vim.g.mapleader = ' '

NoobDir.setup({})
NoobTerm.setup({})

--- Vanilla Features Mapping
vim.keymap.set('i', '<C-s>', '<Esc>', { silent=true, desc='Change to normal mode' })
vim.keymap.set("n", '<leader>re', '<cmd>restart<cr>')

--- Custom Features Mapping
vim.keymap.set({'i', 'n'}, '<C-e>', function() NoobDir.open() end, { noremap = true, silent = true })
vim.keymap.set({'i', 'n'}, '<C-y>', function() NoobTerm.toggle() end, { noremap = true, silent = true })
