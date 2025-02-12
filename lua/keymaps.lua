vim.keymap.set('n', '<leader>ttt', ':TransparentToggle<CR>', { noremap = true, silent = true, desc = '[T]ransparent Mode' })

vim.keymap.set('n', '<leader>tc', ':Telescope colorscheme<CR>', { noremap = true, silent = true, desc = '[Change [T]heme]' })
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

vim.keymap.set('n', '<leader>e', vim.diagnostic.setloclist, { desc = 'Open diagnostic/[E]rror list' })

vim.keymap.set('n', '<leader>q', ':bd<CR>', { noremap = true, silent = true, desc = '[Q]uit current buffer' })
vim.api.nvim_set_keymap('n', '<cmd>h', ':lua print("Hello")<CR>', { noremap = true, silent = true })
-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
--
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- TIP: Disable arrow keys in normal mode
-- vim.keymap.set('n', '<left>', '<cmd>echo "Use h to move!!"<CR>')
-- vim.keymap.set('n', '<right>', '<cmd>echo "Use l to move!!"<CR>')
-- vim.keymap.set('n', '<up>', '<cmd>echo "Use k to move!!"<CR>')
-- vim.keymap.set('n', '<down>', '<cmd>echo "Use j to move!!"<CR>')

-- Keybinds to make split navigation easier.
--  Use CTRL+<hjkl> to switch between windows
--
--  See `:help wincmd` for a list of all window commands
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

-- NOTE: Cycle through buffers
vim.api.nvim_set_keymap('n', '<C-p>', ':bprevious<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-n>', ':bnext<CR>', { noremap = true, silent = true })

-- NOTE: REST
vim.api.nvim_buf_set_keymap(0, 'n', '<leader>rr', "<cmd>lua require('kulala').run()<cr>", { noremap = true, silent = true, desc = 'Execute the request' })
vim.api.nvim_buf_set_keymap(0, 'n', '[', "<cmd>lua require('kulala').jump_prev()<cr>", { noremap = true, silent = true, desc = 'Jump to the previous request' })

vim.api.nvim_buf_set_keymap(0, 'n', ']', "<cmd>lua require('kulala').jump_next()<cr>", { noremap = true, silent = true, desc = 'Jump to the next request' })

vim.api.nvim_buf_set_keymap(
  0,
  'n',
  '<leader>i',
  "<cmd>lua require('kulala').inspect()<cr>",
  { noremap = true, silent = true, desc = 'Inspect the current request' }
)

vim.api.nvim_buf_set_keymap(
  0,
  'n',
  '<leader>t',
  "<cmd>lua require('kulala').toggle_view()<cr>",
  { noremap = true, silent = true, desc = 'Toggle between body and headers' }
)
