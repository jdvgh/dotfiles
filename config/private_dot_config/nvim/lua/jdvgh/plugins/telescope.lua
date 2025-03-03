return {
  { -- Fuzzy Finder (files, lsp, etc)
    'nvim-telescope/telescope.nvim',
    event = 'VimEnter',
    branch = '0.1.x',
    dependencies = {
      'nvim-lua/plenary.nvim',
      { -- If encountering errors, see telescope-fzf-native README for install instructions
        'nvim-telescope/telescope-fzf-native.nvim',

        -- `build` is used to run some command when the plugin is installed/updated.
        -- This is only run then, not every time Neovim starts up.
        build = 'make',

        -- `cond` is a condition used to determine whether this plugin should be
        -- installed and loaded.
        cond = function()
          return vim.fn.executable 'make' == 1
        end,
      },
      { 'nvim-telescope/telescope-ui-select.nvim' },

      -- Useful for getting pretty icons, but requires special font.
      --  If you already have a Nerd Font, or terminal set up with fallback fonts
      --  you can enable this
      -- { 'nvim-tree/nvim-web-devicons' }
    },
    config = function()
      -- Telescope is a fuzzy finder that comes with a lot of different things that
      -- it can fuzzy find! It's more than just a "file finder", it can search
      -- many different aspects of Neovim, your workspace, LSP, and more!
      --
      -- The easiest way to use telescope, is to start by doing something like:
      --  :Telescope help_tags
      --
      -- After running this command, a window will open up and you're able to
      -- type in the prompt window. You'll see a list of help_tags options and
      -- a corresponding preview of the help.
      --
      -- Two important keymaps to use while in telescope are:
      --  - Insert mode: <c-/>
      --  - Normal mode: ?
      --
      -- This opens a window that shows you all of the keymaps for the current
      -- telescope picker. This is really useful to discover what Telescope can
      -- do as well as how to actually do it!

      -- [[ Configure Telescope ]]
      -- See `:help telescope` and `:help telescope.setup()`
      require('telescope').setup {
        -- You can put your default mappings / updates / etc. in here
        --  All the info you're looking for is in `:help telescope.setup()`
        --
        -- defaults = {
        --   mappings = {
        --     i = { ['<c-enter>'] = 'to_fuzzy_refine' },
        --   },
        -- },
        -- pickers = {}
        extensions = {
          ['ui-select'] = {
            require('telescope.themes').get_dropdown(),
          },
        },
      }

      -- Enable telescope extensions, if they are installed
      pcall(require('telescope').load_extension, 'fzf')
      pcall(require('telescope').load_extension, 'ui-select')

      -- See `:help telescope.builtin`
      local builtin = require 'telescope.builtin'
      -- vim.keymap.set('n', '<leader>pf',
      --     function()
      --         builtin.find_files({ no_ignore = true })
      --     end, { desc = "Find File no Ignore" })
      -- vim.keymap.set('n', '<leader>pp', builtin.git_files, { desc = "Find Git Files" })
      -- vim.keymap.set('n', '<leader>pg', function()
      --     builtin.grep_string({ search = vim.fn.input("Grep > ") })
      -- end, { desc = "Grep Search" })
      vim.keymap.set('x', '<leader>sG', builtin.grep_string, { desc = "[S]earch [G]rep String Search" })
      vim.keymap.set('n', '<leader>sH', builtin.help_tags, { desc = "[S]earch [H]elp Tags" })
      vim.keymap.set('n', '<leader>sh', builtin.help_tags, { desc = '[S]earch [H]elp' })
      vim.keymap.set('n', '<leader>sk', builtin.keymaps, { desc = '[S]earch [K]eymaps' })
      vim.keymap.set('n', '<leader>sf', builtin.find_files, { desc = '[S]earch [F]iles' })
      vim.keymap.set('n', '<leader>sF', function() builtin.find_files({ no_ignore = true }) end,
        { desc = '[S]earch [F]iles no ignore' })
      vim.keymap.set('n', '<leader>ss', builtin.builtin, { desc = '[S]earch [S]elect Telescope' })
      vim.keymap.set('n', '<leader>sw', builtin.grep_string, { desc = '[S]earch current [W]ord' })
      vim.keymap.set('n', '<leader>sg', builtin.live_grep, { desc = '[S]earch by [G]rep' })
      vim.keymap.set('n', '<leader>sG', builtin.git_files, { desc = '[S]earch by [G]itFiles' })
      vim.keymap.set('n', '<leader>sd', builtin.diagnostics, { desc = '[S]earch [D]iagnostics' })
      vim.keymap.set('n', '<leader>sr', builtin.resume, { desc = '[S]earch [R]esume' })
      vim.keymap.set('n', '<leader>s.', builtin.oldfiles, { desc = '[S]earch Recent Files ("." for repeat)' })
      vim.keymap.set('n', '<leader><leader>', builtin.buffers, { desc = '[ ] Find existing buffers' })
      --
      -- -- Slightly advanced example of overriding default behavior and theme
      vim.keymap.set('n', '<leader>sb', function()
        -- You can pass additional configuration to telescope to change theme, layout, etc.
        builtin.current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
          winblend = 10,
          previewer = false,
        })
      end, { desc = '[S]earch current [B]uffer fuzzily' })
      vim.keymap.set('x', '<leader>sb', function()
        -- You can pass additional configuration to telescope to change theme, layout, etc.
        builtin.current_buffer_fuzzy_find()
      end, { desc = '[S]earch current [B]uffer fuzzily' })
      --
      -- -- Also possible to pass additional configuration options.
      -- --  See `:help telescope.builtin.live_grep()` for information about particular keys
      -- vim.keymap.set('n', '<leader>s/', function()
      --     builtin.live_grep {
      --         grep_open_files = true,
      --         prompt_title = 'Live Grep in Open Files',
      --     }
      -- end, { desc = '[S]earch [/] in Open Files' })
      --
      -- -- Shortcut for searching your neovim configuration files
      vim.keymap.set('n', '<leader>sn', function()
        builtin.find_files { cwd = vim.fn.stdpath 'config' }
      end, { desc = '[S]earch [N]eovim files' })
      vim.keymap.set('n', '<leader>sa', function()
        builtin.find_files { cwd = '~/dev/' }
      end, { desc = '[S]earch [A]ll files in ~/dev/' }

      )
      vim.keymap.set({ 'n', 'v' },
        "<leader>cct",
        function()
          local chat = require("CopilotChat")
          chat.toggle()
        end,
        { desc = "[C]opilot[C]hat - [T]oggle" }
      )
      -- Show prompts actions with telescope
      vim.keymap.set({ 'v' },
        "<leader>ccp",
        function()
          local actions = require("CopilotChat.actions")
          local integrations = require("CopilotChat.integrations.telescope")
          integrations.pick(actions.prompt_actions())
        end,
        { desc = "[C]opilot[C]hat - [P]rompt actions" }
      )
      vim.keymap.set({ 'n' },
        "<leader>sp",
        function()
          local previewers = require("telescope.previewers")
          local pickers = require("telescope.pickers")
          local sorters = require("telescope.sorters")
          local finders = require("telescope.finders")
          pickers
              .new({}, {
                results_title = "Modified in current branch",
                finder = finders.new_oneshot_job({
                  "git",
                  "diff",
                  "--name-only",
                  "--diff-filter=ACMR",
                  "origin...",
                }, {}),
                sorter = sorters.get_fuzzy_file(),
                previewer = previewers.new_termopen_previewer({
                  get_command = function(entry)
                    return {
                      "git",
                      "diff",
                      "--diff-filter=ACMR",
                      "origin...",
                      "--",
                      entry.value,
                    }
                  end,
                }),
              })
              :find()
        end,
        { desc = "[S]earch files changed on [P]R/branch" }
      )
    end,
  },
}
-- vim: ts=2 sts=2 sw=2 et
