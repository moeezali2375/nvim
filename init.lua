-- Required configuration files
-- These files should set global options, define keymaps, and setup autocommands.
require 'config'
require 'keymaps'
require 'autocommands'

-- Bootstrap lazy.nvim
-- This section checks if lazy.nvim is installed and installs it if not.
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
  local out = vim.fn.system { 'git', 'clone', '--filter=blob:none', '--branch=stable', lazyrepo, lazypath }
  if vim.v.shell_error ~= 0 then
    error('Error cloning lazy.nvim:\n' .. out)
  end
end
vim.opt.rtp:prepend(lazypath)

-- Setup lazy.nvim with your plugin specifications
require('lazy').setup({
  -- You can place individual plugin specs directly here if they are small
  -- or if they don't logically fit into a separate file.

  -- Example: lazydev and luvit-meta (often small and related to core setup)
  {
    'folke/lazydev.nvim',
    ft = 'lua',
    opts = {
      library = {
        { path = 'luvit-meta/library', words = { 'vim%.uv' } },
      },
    },
  },
  { 'Bilal2453/luvit-meta', lazy = true },

  -- Import all plugin specifications from the 'lua/plugins/' directory.
  -- Each file in this directory (e.g., lua/plugins/lsp.lua, lua/plugins/completion.lua)
  -- should return a table of plugin specs.
  -- lazy.nvim will automatically load these.
  { import = 'plugins' },

  -- Optionally, you can include the colorscheme here directly or in a plugin file.
  -- If you uncomment this, make sure 'cyberdream' is available (e.g., via a plugin spec in `plugins/colorscheme.lua`)
  -- {
  --   'folke/tokyonight.nvim', -- Example: Or your actual colorscheme plugin
  --   priority = 1000,
  --   init = function()
  --     vim.cmd.colorscheme 'cyberdream' -- Replace with your desired colorscheme
  --     -- vim.cmd.hi 'Comment gui=none' -- Example highlight override
  --   end,
  -- },
}, {
  -- Global lazy.nvim settings
  ui = {
    -- If you are using a Nerd Font: set icons to an empty table which will use the
    -- default lazy.nvim defined Nerd Font icons, otherwise define a unicode icons table
    icons = vim.g.have_nerd_font and {} or {
      cmd = '⌘',
      config = '🛠',
      event = '📅',
      ft = '📂',
      init = '⚙',
      keys = '🗝',
      plugin = '🔌',
      runtime = '💻',
      require = '🌙',
      source = '📄',
      start = '🚀',
      task = '📌',
      lazy = '💤 ',
    },
  },
  -- Add other lazy.nvim global options here if needed, e.g., for debugging
  -- debug = true,
  -- checker = { enabled = true },
})

-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et
