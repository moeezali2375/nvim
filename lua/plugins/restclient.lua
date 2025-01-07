return {
  'rest-nvim/rest.nvim',
  config = function()
    vim.g.rest_nvim = {
      result_split_horizontal = false,
      result_split_vertical = false,
    }
    vim.api.nvim_create_autocmd('FileType', {
      pattern = 'http',
      callback = function()
        vim.api.nvim_buf_set_keymap(0, 'n', '<leader>rr', ':Rest run<CR>', { noremap = true, silent = true })
      end,
    })
  end,
}
