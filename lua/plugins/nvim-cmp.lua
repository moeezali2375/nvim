return {
  {
    'hrsh7th/nvim-cmp',
    event = 'InsertEnter', -- Load the plugin when entering insert mode
    dependencies = {
      -- Snippet Engine & its associated nvim-cmp source
      {
        'L3MON4D3/LuaSnip',
        build = (function()
          -- Build step is needed for regex support in snippets.
          -- Skip on Windows or if 'make' is not executable.
          if vim.fn.has 'win32' == 1 or vim.fn.executable 'make' == 0 then
            return
          end
          return 'make install_jsregexp'
        end)(),
        dependencies = {
          -- `friendly-snippets` contains a variety of premade snippets.
          -- Lazy load VS Code and Lua snippets.
          {
            'rafamadriz/friendly-snippets',
            config = function()
              require('luasnip.loaders.from_vscode').lazy_load()
              -- Load snippets from your custom snippets directory (e.g., ~/.config/nvim/lua/snippets/)
              require('luasnip.loaders.from_lua').load { paths = { './lua/snippets/' } }
            end,
          },
        },
      },
      'saadparwaiz1/cmp_luasnip', -- nvim-cmp source for LuaSnip

      -- Other nvim-cmp sources
      'hrsh7th/cmp-nvim-lsp', -- LSP source (for completions from language servers)
      'hrsh7th/cmp-path', -- File path completion
      'hrsh7th/cmp-buffer', -- Buffer words completion (uncomment if desired)
      'hrsh7th/cmp-nvim-lsp-signature-help',
      'hrsh7th/cmp-cmdline',
      'hrsh7th/cmp-emoji',
    },
    config = function()
      local cmp = require 'cmp'
      local luasnip = require 'luasnip'

      luasnip.config.setup {} -- Basic setup for LuaSnip

      cmp.setup {
        snippet = {
          -- Configure how nvim-cmp expands snippets using LuaSnip
          expand = function(args)
            luasnip.lsp_expand(args.body)
          end,
        },
        -- Options for completion menu behavior
        completion = {
          completeopt = 'menu,menuone,noinsert', -- Show menu, select one item by default, don't auto-insert
        },

        -- Key mappings for completion
        mapping = cmp.mapping.preset.insert {
          ['<C-n>'] = cmp.mapping.select_next_item(), -- Select next item in the completion menu
          ['<C-p>'] = cmp.mapping.select_prev_item(), -- Select previous item in the completion menu

          -- Scroll documentation window
          ['<C-b>'] = cmp.mapping.scroll_docs(-4), -- Scroll documentation back
          ['<C-f>'] = cmp.mapping.scroll_docs(4), -- Scroll documentation forward

          -- ['<C-y>'] = cmp.mapping.confirm { select = true }, -- Accept the selected completion.
          -- This will auto-import if your LSP supports it
          -- and expand snippets if the LSP sent a snippet.

          -- Custom Tab behavior: confirm completion if visible, otherwise fallback (e.g., insert a literal tab)
          ['<Tab>'] = function(fallback)
            if cmp.visible() then
              cmp.mapping.confirm { select = true }()
            else
              fallback()
            end
          end,

          ['<C-y>'] = cmp.mapping.complete {}, -- Manually trigger completion

          -- Navigate through snippet placeholders (jump points)
          ['<C-l>'] = cmp.mapping(function()
            if luasnip.expand_or_locally_jumpable() then
              luasnip.expand_or_jump()
            end
          end, { 'i', 's' }), -- Applies in Insert and Snippet modes
          ['<C-h>'] = cmp.mapping(function()
            if luasnip.locally_jumpable(-1) then
              luasnip.jump(-1)
            end
          end, { 'i', 's' }), -- Applies in Insert and Snippet modes
        },

        -- Sources for completion suggestions
        sources = {
          {
            name = 'lazydev', -- Provided by lazydev.nvim for Lua development
            group_index = 0, -- Set group index to 0 to skip LuaLS completions as lazydev recommends it
          },
          { name = 'nvim_lsp' }, -- Suggestions from Language Servers
          { name = 'luasnip' }, -- Suggestions from snippets
          { name = 'path' }, -- File path suggestions
          { name = 'buffer' }, -- Buffer word suggestions (uncomment if desired)
          { name = 'nvim_lsp_signature_help' },
          { name = 'cmdline' },
          { name = 'emoji' },
        },
      }
    end,
  },
}
