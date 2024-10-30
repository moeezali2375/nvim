return {
  'nvim-neo-tree/neo-tree.nvim',
  version = '*',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-tree/nvim-web-devicons',
    'MunifTanjim/nui.nvim',
  },
  cmd = 'Neotree',
  keys = {
    { '\\', ':Neotree reveal right<CR>:set relativenumber<CR>', desc = 'NeoTree reveal', silent = true },
  },
  opts = {
    event_handlers = {
      event = 'neo_tree_buffer_enter',
      handler = function()
        vim.opt_local.relativenumber = true
      end,
    },
    filesystem = {
      window = {
        mappings = {
          ['\\'] = 'close_window',
        },
      },
    },
  },
}
