vim.g.mapleader = " "
vim.g.maplocalleader = ' '

-- Diagnostic keymaps
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous [D]iagnostic message' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next [D]iagnostic message' })
vim.keymap.set('n', '<leader>ce', vim.diagnostic.open_float, { desc = 'Show diagnostic [E]rror messages' })
vim.keymap.set('n', '<leader>cq', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

vim.keymap.set('n', ']q', "<cmd>cnext<CR>", { desc = 'Quick Fix [N]ext' })
vim.keymap.set('n', '[q', "<cmd>cprevious<CR>", { desc = 'Quick Fix [P]revious' })
-- save with <C-s>
vim.keymap.set("n", "<C-s>", "<cmd>w!<CR>", { desc = "Force Safe File" })
-- Set highlight on search, but clear on pressing <Esc> in normal mode
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')
-- greatest remap ever
vim.keymap.set("x", "<leader>P", [["_dP]], { desc = "Paste w/o updating Register" })

-- next greatest remap ever : asbjornHaland
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]], { desc = "Yank into Clipboard" })
vim.keymap.set("n", "<leader>Y", [["+Y]], { desc = "Yank Line into Clipboard and buffer" })
