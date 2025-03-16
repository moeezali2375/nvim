return {
  'nvimdev/dashboard-nvim',
  event = 'VimEnter',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  config = function()
    require('dashboard').setup {
      config = {
        header = {
          '    __  ___                         ___    ___ ',
          '   /  |/  /___  ___  ___  ____     /   |  / (_)',
          '  / /|_/ / __ \\/ _ \\ / _ \\/_  /    / /| | / / / ',
          ' / /  / / /_/ /  __/  __/ / /_   / ___ |/ / /  ',
          '/_/  /_/\\____/\\___/\\___/ /___/  /_/  |_/_/_/   ',
          '                                               ',
          ' Welcome, Moeez Ali! 🚀 Ready to code? ',
          '                                               ',
        },
        center = {
          { icon = '📂 ', desc = ' Find File', action = 'Telescope find_files' },
          { icon = '🔍 ', desc = ' Find Text', action = 'Telescope live_grep' },
          { icon = '📜 ', desc = ' Recent Files', action = 'Telescope oldfiles' },
          { icon = '⚙️  ', desc = ' Settings', action = 'e ~/.config/nvim/init.lua' },
          { icon = '❌ ', desc = ' Quit', action = 'qa' },
        },
        footer = {
          '',
          '🚀 Neovim loaded successfully! Happy Coding, Moeez!',
          '',
        },
      },
    }
  end,
}
