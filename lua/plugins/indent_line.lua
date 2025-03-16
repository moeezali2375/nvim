return {
  'lukas-reineke/indent-blankline.nvim',
  main = 'ibl',
  opts = {
    exclude = {
      buftypes = { 'terminal', 'nofile' },
      filetypes = { 'dashboard', 'alpha' },
    },
  },
}
