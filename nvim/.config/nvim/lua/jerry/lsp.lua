local opts = { noremap=true, silent=true }
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)

local on_attach = function(client, bufnr)
  local bufopts = { noremap=true, silent=true, buffer=bufnr }
  vim.keymap.set('n', '<leader>r', '<cmd> lua vim.lsp.buf.format({async=true})<cr>', {noremap = true, silent = true})
  vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
  vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
  vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
  vim.keymap.set('n', '<leader>D', vim.lsp.buf.type_definition, bufopts)
  vim.keymap.set('n', '<leader><leader>r', vim.lsp.buf.rename, bufopts)
  vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, bufopts)
end


-- require('nvim-lsp-installer').setup{}
-- require('lspconfig')['pyright'].setup{
--     on_attach = on_attach,
--     flags = lsp_flags,
--     capabilities = capabilities,
-- }
