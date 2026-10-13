local NoobDir = require('noobdir')

vim.g.mapleader = ' '

NoobDir.setup({})

vim.keymap.set('i', '<C-e>', function() NoobDir.open() end, { noremap = true, silent = true })
vim.keymap.set("n", '<leader>re', '<cmd>restart<cr>')
vim.keymap.set('i', '<C-s>', '<Esc>', { silent=true, desc='Change to normal mode' })
