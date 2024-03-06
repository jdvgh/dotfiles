vim.g.mapleader = " "
vim.g.maplocalleader = ' '
-- save with <C-s>

-- Set highlight on search, but clear on pressing <Esc> in normal mode
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')
vim.keymap.set("n", "<C-s>", "<cmd>w!<CR>", { desc = "Force Safe File" })
-- greatest remap ever
vim.keymap.set("x", "<leader>P", [["_dP]], { desc = "Paste w/o updating Register" })

-- next greatest remap ever : asbjornHaland
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]], { desc = "Yank into Clipboard" })
vim.keymap.set("n", "<leader>Y", [["+Y]], { desc = "Yank Line into Clipboard and buffer" })
