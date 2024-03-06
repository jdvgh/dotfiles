return {
    {
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v3.x",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
            "MunifTanjim/nui.nvim",
            "3rd/image.nvim",              -- Optional image support in preview window: See `# Preview Mode` for more information
        },
        config = function()
            vim.keymap.set("n", "<leader>e", "<cmd>Neotree toggle reveal<CR>", { desc = "Toggle Neo Tree" })
            vim.keymap.set("n", "<leader>o", function()
                if vim.bo.filetype == "neo-tree" then vim.cmd.wincmd "p" else vim.cmd.Neotree "focus" end
            end
            , { desc = "Neo Tree switch Focus" })
        end
    }
}

