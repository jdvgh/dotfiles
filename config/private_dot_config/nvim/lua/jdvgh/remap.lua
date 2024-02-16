vim.g.mapleader = " "
-- save with <C-s>

vim.keymap.set("n", "<C-s>", "<cmd>w!<CR>", { desc = "Force Safe File" })
-- greatest remap ever
vim.keymap.set("x", "<leader>P", [["_dP]], { desc = "Paste w/o updating Register" })

-- next greatest remap ever : asbjornHaland
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]], { desc = "Yank into Clipboard" })
vim.keymap.set("n", "<leader>Y", [["+Y]], { desc = "Yank Line into Clipboard and buffer" })

vim.keymap.set("n", "<leader>e", "<cmd>Neotree toggle reveal<CR>", { desc = "Toggle Neo Tree" })
vim.keymap.set("n", "<leader>o", function()
    neotree = require("neo-tree").setup {}
    if vim.bo.filetype == "neo-tree" then vim.cmd.wincmd "p" else vim.cmd.Neotree "focus" end
end
, { desc = "Neo Tree switch Focus" })

vim.keymap.set("n", "<leader>/",
    function() require("Comment.api").toggle.linewise.count(vim.v.count > 0 and vim.v.count or 1) end
    , { desc = "Comment selection Linewise" })
vim.keymap.set("v", "<leader>/",
    "<esc><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<cr>"
    , { desc = "Comment selection Linewise" })
vim.keymap.set("n", "<leader>f", vim.lsp.buf.format, { desc = "Format" })
