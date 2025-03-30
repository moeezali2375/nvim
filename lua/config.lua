vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

vim.g.have_nerd_font = true

vim.keymap.set('n', '<leader>e', vim.cmd.Ex)

vim.opt.tabstop = 2
vim.o.shiftwidth = 2

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
-- Make line numbers default
vim.o.number = true
-- You can also add relative line numbers, to help with jumping.
--  Experiment for yourself to see if you like it!
vim.o.relativenumber = true

-- Enable mouse mode, can be useful for resizing splits for example!
vim.o.mouse = 'a'

-- Don't show the mode, since it's already in the status line
vim.opt.showmode = false

-- Sync clipboard between OS and Neovim.
--  Schedule the setting after `UiEnter` because it can increase startup-time.
--  Remove this option if you want your OS clipboard to remain independent.
--  See `:help 'clipboard'`
vim.schedule(function()
  vim.opt.clipboard = 'unnamedplus'
end)

-- Enable break indent
vim.opt.breakindent = true

-- Save undo history
vim.opt.undofile = true

-- Case-insensitive searching UNLESS \C or one or more capital letters in the search term
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Keep signcolumn on by default
vim.opt.signcolumn = 'yes'

-- Decrease update time
vim.opt.updatetime = 250

-- Decrease mapped sequence wait time
-- Displays which-key popup sooner
vim.opt.timeoutlen = 300

-- Configure how new splits should be opened
vim.opt.splitright = true
vim.opt.splitbelow = true

-- Sets how neovim will display certain whitespace characters in the editor.
--  See `:help 'list'`
--  and `:help 'listchars'`
vim.opt.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }

-- Preview substitutions live, as you type!
vim.opt.inccommand = 'split'

-- Show which line your cursor is on
vim.opt.cursorline = true

-- Minimal number of screen lines to keep above and below the cursor.
vim.opt.scrolloff = 10

vim.api.nvim_create_autocmd('User', {
  pattern = 'RestResponsePre',
  callback = function()
    local res = _G.rest_response

    local is_json, json_data = pcall(vim.json.decode, res.body)

    if is_json then
      local cmd = 'echo "' .. res.body:gsub('"', '\\"') .. '" | js-beautify'
      local handle = io.popen(cmd)

      if handle then
        local formatted = handle:read '*a'
        local exit_code = handle:close()

        if formatted and #formatted > 0 then
          res.body = formatted
        else
          if exit_code ~= 0 then
            print('js-beautify error, exit code: ' .. exit_code)
          else
            print 'js-beautify output was empty'
          end
        end
      else
        print 'failed to run js-beautify'
      end
    end
  end,
})
