-- In your lazy config file (usually lazy.lua or similar)
return {
  {
    'navarasu/onedark.nvim',
    config = function()
      require('onedark').setup {
        -- Main options --
        style = 'darker', -- Choose between 'dark', 'darker', 'cool', 'deep', 'warm', 'warmer', and 'light'
        transparent = false,  -- Enable transparent background
        term_colors = true, -- Change terminal colors as per the selected theme style
        ending_tildes = false, -- Hide end-of-buffer tildes
        cmp_itemkind_reverse = false, -- Reverse item kind highlights in cmp menu

        -- Change code style ---
        code_style = {
          comments = 'italic',
          keywords = 'none',
          functions = 'none',
          strings = 'none',
          variables = 'none'
        },

        -- Lualine options --
        lualine = {
          transparent = true, -- Enable transparent lualine
        },

        -- Custom Highlights --
        colors = {}, -- Override default colors
        highlights = {}, -- Override highlight groups

        -- Plugins Config --
        diagnostics = {
          darker = true, -- Darker colors for diagnostics
          undercurl = true,   -- Use undercurl instead of underline for diagnostics
          background = true,    -- Use background color for virtual text
        },
      }
    end
  }
}
