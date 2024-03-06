return {
    {
        'alexghergh/nvim-tmux-navigation',
        config = function()
            local nvim_tmux_nav = require('nvim-tmux-navigation')
            nvim_tmux_nav.setup {
                disable_when_zoomed = false -- defaults to false
            }

            -- vim.keymap.set('n', "<C-h>", nvim_tmux_nav.NvimTmuxNavigateLeft)
            -- vim.keymap.set('n', "<C-j>", nvim_tmux_nav.NvimTmuxNavigateDown)
            -- vim.keymap.set('n', "<C-k>", nvim_tmux_nav.NvimTmuxNavigateUp)
            -- vim.keymap.set('n', "<C-l>", nvim_tmux_nav.NvimTmuxNavigateRight)
            vim.keymap.set('n', "<C-Left>", nvim_tmux_nav.NvimTmuxNavigateLeft, { desc = "Left" })
            vim.keymap.set('n', "<C-Down>", nvim_tmux_nav.NvimTmuxNavigateDown, { desc = "Down" })
            vim.keymap.set('n', "<C-Up>", nvim_tmux_nav.NvimTmuxNavigateUp, { desc = "Up" })
            vim.keymap.set('n', "<C-Right>", nvim_tmux_nav.NvimTmuxNavigateRight, { desc = "Right" })
            vim.keymap.set('n', "<C-\\>", nvim_tmux_nav.NvimTmuxNavigateLastActive, { desc = "LastActive" })
            vim.keymap.set('n', "<C-Space>", nvim_tmux_nav.NvimTmuxNavigateNext, { desc = "Next" })
        end
    } }
