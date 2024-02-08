vim.g.mapleader = " "
-- save with <C-s>

vim.keymap.set("n", "<C-s>", "<cmd>w!<CR>")
-- greatest remap ever
vim.keymap.set("x", "<leader>P", [["_dP]])

-- next greatest remap ever : asbjornHaland
vim.keymap.set({"n", "v"}, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

vim.keymap.set("n","<leader>e", "<cmd>Neotree toggle reveal<CR>")
vim.keymap.set("n","<leader>o", function()
	neotree = require("neo-tree").setup{}
if vim.bo.filetype == "neo-tree" then vim.cmd.wincmd "p" else vim.cmd.Neotree "focus" end 
end
	)

  vim.keymap.set("n","<leader>/",
    function() require("Comment.api").toggle.linewise.count(vim.v.count > 0 and vim.v.count or 1) end
 )
  vim.keymap.set("v","<leader>/", 
    "<esc><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<cr>"
  )
vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)
-- vim.keymap.set("n","<leader>o", function() if vim.bo.filetype == "neo-tree" then vim.cmd.wincmd "p" else vim.cmd.Neotree "focus" end )
-- vim.keymap.set("n","<leader>o", function() if vim.bo.filetype == "neo-tree" then vim.cmd.wincmd "p" else vim.cmd.Neotree "focus" end )

-- vim.keymap.set("n","<leader>o", function() if vim.bo.filetype == "neo-tree" then  vim.cmd.wincmd "p"   else  vim.cmd.Neotree "focus" end ) 

-- vim.keymap.set({"n", "v","i","x"}, "<Down>", "<Nop>")
-- vim.keymap.set({"n", "v","i","x"}, "<Right>", "<Nop>")
-- vim.keymap.set({"n", "v","i","x"}, "<Left>", "<Nop>")
-- vim.keymap.set({"n", "v","i","x"},"<Up>", "<Nop>")

