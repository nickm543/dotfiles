-- Set tabbing
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

-- Line numbers
vim.wo.number = true

-- Set leader key
vim.g.mapleader = " "

-- Other bindings
vim.keymap.set('n', '<leader>nh', '<Cmd>noh<CR>')
