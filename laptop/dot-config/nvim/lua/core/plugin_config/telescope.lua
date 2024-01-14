require("telescope").setup()

vim.keymap.set('n', '<leader>f', '<Cmd>Telescope find_files<CR>')
vim.keymap.set('n', '<leader>b', '<Cmd>Telescope buffers<CR>')
