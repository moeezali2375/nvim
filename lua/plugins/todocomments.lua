return {
  'folke/todo-comments.nvim',
  event = 'VimEnter',
  dependencies = { 'nvim-lua/plenary.nvim' },
  opts = {
    signs = false,
  },
  config = function(_, opts)
    require('todo-comments').setup(opts)

    local keymap = vim.keymap.set
    local silent = { silent = true }

    -- 👈 Jump to previous TODO
    keymap('n', ']t', function()
      require('todo-comments').jump_next()
    end, { desc = 'Next todo comment' })

    -- 👉 Jump to next TODO
    keymap('n', '[t', function()
      require('todo-comments').jump_prev()
    end, { desc = 'Previous todo comment' })

    -- 🔭 Telescope search for TODOs
    keymap('n', '<leader>st', ':TodoTelescope<CR>', { desc = 'Search todos with Telescope' })
  end,
}
