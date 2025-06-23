
return {
  {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate', -- Command to run after installation to fetch parsers
    main = 'nvim-treesitter.configs', -- Explicitly set the main module for options
    opts = {
      ensure_installed = { -- List of languages to install parsers for
        'bash',
        'c',
        'diff',
        'html',
        'lua',
        'luadoc',
        'markdown',
        'markdown_inline',
        'query',
        'vim',
        'vimdoc',
        -- Add more languages as needed, e.g.:
        -- 'javascript', 'typescript', 'python', 'rust', 'go', 'json', 'yaml', 'css'
      },
      auto_install = true, -- Automatically install missing parsers
      highlight = {
        enable = true, -- Enable Treesitter syntax highlighting
        -- Some languages may rely on Vim's regex highlighting for certain aspects.
        -- Add them here if you notice issues.
        additional_vim_regex_highlighting = { 'ruby' },
      },
      indent = {
        enable = true, -- Enable Treesitter-based indentation
        disable = { 'ruby' }, -- Disable Treesitter indentation for certain languages if problematic
      },
    },
    -- You can add other Treesitter-related modules here, for example:
    -- 'nvim-treesitter/nvim-treesitter-context', -- Shows current function/class context
    -- 'nvim-treesitter/nvim-treesitter-textobjects', -- Extends text objects (e.g., `vaF` for "around function")
  },
}
