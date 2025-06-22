-- Add this to your Telescope configuration file (or wherever you define the plugin)
return {
  'nvim-telescope/telescope.nvim',
  event = 'VimEnter',
  branch = '0.1.x',
  dependencies = {
    'nvim-lua/plenary.nvim',
    {
      'nvim-telescope/telescope-fzf-native.nvim',
      build = 'make',
      cond = function()
        return vim.fn.executable 'make' == 1
      end,
    },
    { 'nvim-telescope/telescope-ui-select.nvim' },
    { 'nvim-tree/nvim-web-devicons', enabled = vim.g.have_nerd_font },
  },
  config = function()
    -- Function to check if a command exists
    local function command_exists(cmd)
      return vim.fn.executable(cmd) == 1
    end

    -- Check for ripgrep
    if not command_exists 'rg' then
      vim.notify(
        'Ripgrep (rg) is not installed. Telescope find_files (and live_grep) will not work optimally. Please install it: https://github.com/BurntSushi/ripgrep#installation',
        vim.log.levels.WARN,
        { title = 'Telescope Dependency Warning' }
      )
      -- You might also choose to disable the find_files keymap or use a fallback if rg is not found.
      -- For now, we'll just notify the user.
    end

    -- [[ Configure Telescope ]]
    require('telescope').setup {
      extensions = {
        ['ui-select'] = {
          require('telescope.themes').get_dropdown(),
        },
      },
    }

    -- Enable Telescope extensions if they are installed
    pcall(require('telescope').load_extension, 'fzf')
    pcall(require('telescope').load_extension, 'ui-select')

    -- See `:help telescope.builtin`
    local builtin = require 'telescope.builtin'
    vim.keymap.set('n', '<leader>sh', builtin.help_tags, { desc = '[S]earch [H]elp' })
    vim.keymap.set('n', '<leader>sk', builtin.keymaps, { desc = '[S]earch [K]eymaps' })

    -- Your find_files mapping
    vim.keymap.set('n', '<leader><leader>', function()
      -- Conditionally use your custom find_command only if rg is present
      local find_opts = {
        hidden = true,
      }
      if command_exists 'rg' then
        find_opts.find_command = {
          'rg',
          '--files',
          '--hidden',
          '--no-ignore',
          '--glob',
          '!.git/*',
          '--glob',
          '!**/venv/*',
          '--glob',
          '!**/.next/*',
          '--glob',
          '!**/node_modules/*',
          '--glob',
          '!**/__pycache__/*',
          '--glob',
          '!**/.DS_Store',
          '--glob',
          '!**/dist/*',
        }
      else
        -- Fallback if rg is not found (e.g., use the default 'find' command)
        -- Or just let Telescope use its default behavior without a custom find_command
        -- vim.notify('Using fallback find_files (slower). Install ripgrep for better performance.', vim.log.levels.INFO)
      end
      require('telescope.builtin').find_files(find_opts)
    end, { desc = '[S]earch [A]ll Files (respecting .gitignore)' })

    vim.keymap.set('n', '<leader>ss', builtin.builtin, { desc = '[S]earch [S]elect Telescope' })
    vim.keymap.set('n', '<leader>sw', builtin.grep_string, { desc = '[S]earch current [W]ord' })
    vim.keymap.set('n', '<leader>sg', function()
      if not command_exists 'rg' then
        vim.notify(
          'Ripgrep (rg) is not installed. Live grep requires ripgrep. Please install it: https://github.com/BurntSushi/ripgrep#installation',
          vim.log.levels.ERROR,
          { title = 'Telescope Dependency Error' }
        )
        return -- Exit the function if rg is not present
      end
      builtin.live_grep()
    end, { desc = '[S]earch by [G]rep' })
    vim.keymap.set('n', '<leader>sd', builtin.diagnostics, { desc = '[S]earch [D]iagnostics' })
    vim.keymap.set('n', '<leader>sr', builtin.resume, { desc = '[S]earch [R]esume' })
    vim.keymap.set('n', '<leader>s.', builtin.oldfiles, { desc = '[S]earch Recent Files ("." for repeat)' })
    vim.keymap.set('n', '<leader>b', builtin.buffers, { desc = '[ ] Find existing [B]uffers' })
    local diagnostics_enabled = true

    vim.keymap.set('n', '<leader>vd', function()
      diagnostics_enabled = not diagnostics_enabled
      vim.diagnostic.config {
        virtual_text = diagnostics_enabled,
        underline = diagnostics_enabled,
        signs = diagnostics_enabled,
      }
      vim.notify('Diagnostics ' .. (diagnostics_enabled and 'enabled' or 'disabled'))
    end, { desc = '[V]irtual [D]iagnostics Toggle' })

    -- Slightly advanced example of overriding default behavior and theme
    vim.keymap.set('n', '<leader>/', function()
      -- You can pass additional configuration to Telescope to change the theme, layout, etc.
      builtin.current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
        winblend = 10,
        previewer = false,
      })
    end, { desc = '[/] Fuzzily search in current buffer' })

    -- It's also possible to pass additional configuration options.
    --  See `:help telescope.builtin.live_grep()` for information about particular keys
    vim.keymap.set('n', '<leader>s/', function()
      if not command_exists 'rg' then
        vim.notify(
          'Ripgrep (rg) is not installed. Live grep in open files requires ripgrep. Please install it.',
          vim.log.levels.ERROR,
          { title = 'Telescope Dependency Error' }
        )
        return
      end
      builtin.live_grep {
        grep_open_files = true,
        prompt_title = 'Live Grep in Open Files',
      }
    end, { desc = '[S]earch [/] in Open Files' })

    -- Shortcut for searching your Neovim configuration files
    vim.keymap.set('n', '<leader>sn', function()
      builtin.find_files { cwd = vim.fn.stdpath 'config' }
    end, { desc = '[S]earch [N]eovim files' })
  end,
}
