local lsp_zero = require('lsp-zero')

lsp_zero.on_attach(function(client, bufnr)
    --   -- see :help lsp-zero-keybindings
    --   -- to learn the available actions
    -- lsp_zero.default_keymaps({buffer = bufnr})
    local opts = { buffer = bufnr, remap = false }

    vim.keymap.set('n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>', { buffer = bufnr, remap = false, desc = "Hover" })
    vim.keymap.set('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>', { buffer = bufnr, remap = false, desc =
    "Definition" })
    vim.keymap.set('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>',
        { buffer = bufnr, remap = false, desc = "Declaration" })
    vim.keymap.set('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<cr>',
        { buffer = bufnr, remap = false, desc = "Implementation" })
    vim.keymap.set('n', 'go', '<cmd>lua vim.lsp.buf.type_definition()<cr>',
        { buffer = bufnr, remap = false, desc = "Type Definition" })
    vim.keymap.set('n', 'gr', '<cmd>lua vim.lsp.buf.references()<cr>', { buffer = bufnr, remap = false, desc =
    "References" })
    vim.keymap.set('n', 'gs', '<cmd>lua vim.lsp.buf.signature_help()<cr>',
        { buffer = bufnr, remap = false, desc = "Signature Help" })
    vim.keymap.set('n', '<F2>', '<cmd>lua vim.lsp.buf.rename()<cr>', { buffer = bufnr, remap = false, desc = "Rename" })
    vim.keymap.set({ 'n', 'x' }, '<F3>', '<cmd>lua vim.lsp.buf.format({async = true})<cr>',
        { buffer = bufnr, remap = false, desc = "Format" })
    vim.keymap.set('n', '<F4>', '<cmd>lua vim.lsp.buf.code_action()<cr>',
        { buffer = bufnr, remap = false, desc = "Code Action" })

    vim.keymap.set('n', 'gl', '<cmd>lua vim.diagnostic.open_float()<cr>',
        { buffer = bufnr, remap = false, desc = "Diagnostics - Open Float" })
    vim.keymap.set('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<cr>',
        { buffer = bufnr, remap = false, desc = "Diagnostics - Prev" })
    vim.keymap.set('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<cr>',
        { buffer = bufnr, remap = false, desc = "Diagnostics - Next" })
end)
--
--
--
require('mason').setup({})
require('mason-lspconfig').setup({
    ensure_installed = { gopls, jsonls, lua_ls, terraformls, tflint, tfsec, tsserver, 'python-lsp-server' },
    handlers = {
        lsp_zero.default_setup,
    },
})
