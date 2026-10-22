vim.g.mapleader = ' '

--- Vanilla Features Mapping
vim.keymap.set('i', '<C-s>', '<Esc>', { silent=true, desc='Change to normal mode' })
vim.keymap.set('n', '<leader>re', '<cmd>restart<cr>')
vim.keymap.set('n', 'g9', 'g$', { remap=true })

assert(_G.NoobDir, 'NoobDir have not been initialized!')
assert(_G.NoobTerm, 'NoobTerm have not been initialized!')

--- Custom Features Mapping
vim.keymap.set({'i', 'n'}, '<C-e>', function() NoobDir.open() end, { noremap = true, silent = true })
vim.keymap.set({'i', 'n'}, '<C-\\>', function() NoobTerm.toggle() end, { noremap = true, silent = true })


