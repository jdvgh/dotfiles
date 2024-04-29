-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})


local wr_group = vim.api.nvim_create_augroup('WinResize', { clear = true })

vim.api.nvim_create_autocmd(
  'VimResized',
  {
    group = wr_group,
    pattern = '*',
    command = 'wincmd =',
    desc = 'Automatically resize windows when the host window size changes.'
  }
)
vim.api.nvim_create_autocmd(
  { 'BufEnter', 'BufNewFile' },
  {
    group = vim.api.nvim_create_augroup('jdvgh-filetypes', { clear = true }),
    pattern = '*.gotmpl',
    command = 'set filetype=gotmpl',
    desc = 'Automatically set filetype to gotmpl for files ending in .gotmpl'
  }
)
