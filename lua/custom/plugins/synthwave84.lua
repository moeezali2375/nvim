return {
  'lunarvim/synthwave84.nvim',
  lazy = false,
  priority = 1000,
  config = function()
    require('synthwave84').setup {
      glow = {
        error_msg = true,
        type2 = true,
        func = true,
        keyword = true,
        operator = false,
        buffer_current_target = true,
        buffer_visible_target = true,
        buffer_inactive_target = true,
      },
    }
    vim.cmd.colorscheme 'synthwave84'
  end,
}
