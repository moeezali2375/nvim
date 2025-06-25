return {
  {
    'stevearc/conform.nvim',
    event = { 'BufWritePre' },
    cmd = { 'ConformInfo' }, -- Command to check conform status
    keys = {
      {
        '<leader>f',
        function()
          require('conform').format { async = true, lsp_format = 'fallback' }
        end,
        mode = '',
        desc = '[F]ormat buffer',
      },
    },
    opts = {
      notify_on_error = true,
      formatters_by_ft = {
        lua = { 'stylua' },
        python = { 'isort', 'black', stop_after_first = true },
        javascript = { 'prettierd', 'prettier', stop_after_first = true },
        typescript = { 'prettierd', 'prettier', stop_after_first = true },
        javascriptreact = { 'prettierd', 'prettier', stop_after_first = true },
        typescriptreact = { 'prettierd', 'prettier', stop_after_first = true },
        html = { 'prettier' },
        css = { 'prettier' },
        json = { 'prettier' },
      },
      -- Uncomment and customize `format_on_save` if you want per-language control
      -- format_on_save = function(bufnr)
      --   local disable_filetypes = { c = true, cpp = true }
      --   local lsp_format_opt = 'fallback'
      --   if disable_filetypes[vim.bo[bufnr].filetype] then
      --     lsp_format_opt = 'never'
      --   end
      --   return {
      --     timeout_ms = 500,
      --     lsp_format = lsp_format_opt,
      --   }
      -- end,
    },
  },
}
