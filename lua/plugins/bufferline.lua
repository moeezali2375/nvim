return {
  'akinsho/bufferline.nvim',
  version = '*',
  dependencies = 'nvim-tree/nvim-web-devicons',
  config = function()
    vim.opt.termguicolors = true
    require('bufferline').setup {
      options = {
        mode = 'buffers',
        offsets = {
          {
            filetype = 'neo-tree',
            text = 'Finder',
            highlight = 'directory',
            separator = true,
          },
        },
        diagnostics = 'nvim_lsp',
        separator_style = { '', '' },
        modified_icon = '●',
        show_close_icon = false,
        show_buffer_close_icons = true,
        sort_by = 'insert_after_current', -- Add this to sort buffers in order of opening
      },
    }
  end,
}
