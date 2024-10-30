return {
  {
    'windwp/nvim-ts-autotag',
    config = function()
      require('nvim-ts-autotag').setup {
        opts = {
          enable_close = true, -- Auto close tags
          enable_rename = true, -- Auto rename pairs of tags
          enable_close_on_slash = true, -- Auto close on trailing </
        },
        -- filetypes = { 'html', 'xml', 'javascript', 'typescriptreact', 'javascriptreact' },
        -- skip_tags = { "area", "base", "br", "col", "embed", "hr", "img", "input", "link", "meta", "param", "source", "track", "wbr" },
        -- per_filetype = {
        --   html = {
        --     enable_close = false, -- Disable auto close tags for HTML files
        --   },
        -- },
      }
    end,
  },
}
