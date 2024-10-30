return {
  'nvim-telescope/telescope-file-browser.nvim',
  dependencies = { 'nvim-telescope/telescope.nvim', 'nvim-lua/plenary.nvim' },
  config = function()
    -- Set up the keymap after loading the plugin
    vim.keymap.set('n', '<space>sb', ':Telescope file_browser<CR>', { silent = true })
  end,
}
