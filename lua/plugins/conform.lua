return {
  {
    'stevearc/conform.nvim',
    event = { 'BufWritePre' },
    cmd = { 'ConformInfo' },
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
        python = { 'isort', 'black', stop_after_first = false },
        javascript = { 'prettierd', 'prettier', stop_after_first = true },
        typescript = { 'prettierd', 'prettier', stop_after_first = true },
        javascriptreact = { 'prettierd', 'prettier', stop_after_first = true },
        typescriptreact = { 'prettierd', 'prettier', stop_after_first = true },
        html = { 'prettier' },
        css = { 'prettier' },
        json = { 'prettier' },
        sql = { 'sql_formatter' },
        mysql = { 'sql_formatter' },
        postgresql = { 'sql_formatter' },
      },

      formatters = {
        sql_formatter = {
          command = 'sql-formatter',
          stdin = true,
          args = function(_, ctx)
            -- 🗺️ Map extensions to dialects
            local dialects = {
              psql = 'postgresql',
              mysql = 'mysql',
              sqlite = 'sqlite',
              bq = 'bigquery',
              sql = 'sql', -- fallback
            }

            -- Try file extension first
            local ext = ctx.filename:match '^.+%.([^.]+)$'
            if ext and dialects[ext] then
              return { '--language', dialects[ext] }
            end

            -- Fallback: check buffer's filetype
            local ft_map = {
              mysql = 'mysql',
              postgresql = 'postgresql',
              sql = 'sql',
            }
            local ft = vim.bo[ctx.buf].filetype
            return { '--language', ft_map[ft] or 'sql' }
          end,
        },
      },
    },
  },
}
