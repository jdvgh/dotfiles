vim.keymap.set('n', '<leader>dk', function() require('dap').continue() end, { desc = "Continue" })
vim.keymap.set('n', '<leader>dl', function() require('dap').run_last() end, { desc = "Run Last" })
vim.keymap.set('n', '<leader>db', function() require('dap').toggle_breakpoint() end, { desc = "Toggle Breakpoint" })
vim.keymap.set('n', '<leader>do', function() require('dap').step_over() end, { desc = "Step Over" })
vim.keymap.set('n', '<leader>di', function() require('dap').step_into() end, { desc = "Step Into" })
vim.keymap.set('n', '<leader>dr', function() require('dap').step_out() end, { desc = "Step Out" })
vim.keymap.set('n', '<leader>dq', function() require('dap').terminate() end, { desc = "Terminate" })
