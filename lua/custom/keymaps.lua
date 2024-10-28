vim.keymap.set('n', '<leader>e', vim.cmd.Ex)

-- Set key mapping to open :Lex
vim.keymap.set('n', '<leader>b', ':Lex<CR>', { noremap = true, silent = true })

vim.keymap.set('n', '<leader>ttt', ':TransparentToggle<CR>', { noremap = true, silent = true ,desc="[T]ransparent Mode"})

vim.keymap.set('n','<leader>tc',':Telescope colorscheme<CR>',{noremap=true,silent=true,desc="[Change [T]heme]"})
