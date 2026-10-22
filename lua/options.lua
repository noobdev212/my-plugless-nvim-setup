vim.opt.tabstop        = 2 --- insert \t to whitespace
vim.opt.shiftwidth     = 2 --- tab to 2 spaces
vim.opt.expandtab      = true --- converts \t into spaces
vim.opt.smarttab       = true --- uses shiftwidth tab lengths

vim.opt.wrap           = true --- wraps text instead of scrolling
vim.opt.linebreak      = true --- prevents text splitting when word is wrapped
vim.opt.list           = true --- adds a character for leading space
vim.opt.listchars      = {
  trail   = '᠉',
  extends = '∇'
}
vim.opt.showbreak      = '↳' --- insert when line breaks occurs during wrapping

vim.opt.inccommand     = 'split' --- display words impacted by %s
vim.opt.splitbelow     = true

vim.opt.number         = true
vim.opt.relativenumber = true

vim.opt.ignorecase     = true --- ignore letter cases when using find
vim.opt.smartcase      = true --- changes to case sensitive base on prompt uppercase

vim.opt.swapfile       = false --- will not create a swapfile for sudden exit
vim.opt.backup         = false --- will not create a backup for failed to saved
vim.opt.undofile       = true  --- undo history stored at .local
vim.opt.undodir        = vim.fn.stdpath('data') .. '/undodir'

vim.opt.scrolloff      = 9999 --- drag the screen view during scrolling to cursor at center
vim.opt.signcolumn     = 'yes'
vim.o.cmdheight        = 0
vim.opt.termguicolors  = true
vim.opt.clipboard:append('unnamedplus')
