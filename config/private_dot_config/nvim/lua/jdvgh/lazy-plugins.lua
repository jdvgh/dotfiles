-- [[ Configure and install plugins ]]
--
--  To check the current status of your plugins, run
--    :Lazy
--
--  You can press `?` in this menu for help. Use `:q` to close the window
--
--  To update plugins, you can run
--    :Lazy update
--
-- NOTE: Here is where you install your plugins.
require('lazy').setup {
  'tpope/vim-sleuth',   -- Detect tabstop and shiftwidth automatically
  'alexghergh/nvim-tmux-navigation',
  'mfussenegger/nvim-dap',
  'leoluz/nvim-dap-go',
  'folke/neodev.nvim',
  { "rcarriga/nvim-dap-ui",  dependencies = { "mfussenegger/nvim-dap" } },
  {
    "williamboman/mason.nvim"
  },

  -- NOTE: Plugins can also be added by using a table,
  -- with the first argument being the link and the following
  -- keys can be used to configure plugin behavior/loading/etc.
  --
  -- Use `opts = {}` to force a plugin to be loaded.
  --
  --  This is equivalent to:
  --    require('Comment').setup({})

  {
    "catppuccin/nvim",
    as = "catppuccin",


    config = function()
      vim.cmd('colorscheme catppuccin-latte')
    end
  },
  -- modular approach: using `require 'path/name'` will
  -- include a plugin definition from file lua/path/name.lua

  -- require("jdvgh.plugins.lsp"),

  -- NOTE: The import below can automatically add your own plugins, configuration, etc from `lua/custom/plugins/*.lua`
  --    This is the easiest way to modularize your config.
  --
  --  Uncomment the following line and add your plugins to `lua/custom/plugins/*.lua` to get going.
  --    For additional information, see `:help lazy.nvim-lazy.nvim-structuring-your-plugins`
  { import = 'jdvgh.plugins' },
}

-- vim: ts=2 sts=2 sw=2 et
