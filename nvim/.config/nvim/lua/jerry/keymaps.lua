vim.keymap.set('n', '<leader>y', '"+y', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>p', '"+p', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>/', ':nohl<cr>', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>h', '<c-w>h', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>j', '<c-w>j', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>k', '<c-w>k', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>l', '<c-w>l', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>r', '<cmd> lua vim.lsp.buf.format({async=true})<cr>', { noremap = true, silent = true })

vim.keymap.set('n', '<leader>e', '<cmd>NvimTreeToggle<CR>', { noremap = true, silent = true })

vim.keymap.set('n', '<leader>gf', '<cmd>NvimTreeFindFile<CR>', { noremap = true, silent = true })

vim.keymap.set('n', '<leader>dc', [[:put =strftime('%A, %B %d, %Y')<cr>kJ]], { noremap = true, silent = true })
vim.keymap.set('n', '<leader>ic', ':source $MYVIMRC<cr>', { noremap = true, silent = true })

vim.keymap.set('n', 'gr', '<cmd>lua require("telescope.builtin").lsp_references()<cr>', {})
vim.keymap.set('n', '<leader>u', '<cmd>lua require("telescope.builtin").lsp_document_symbols()<cr>', {})
vim.keymap.set('n', 'gs', '<cmd>lua require("telescope.builtin").lsp_workspace_symbols()<cr>', {})
vim.keymap.set('n', '<leader>gd', '<cmd>lua require("telescope.builtin").diagnostics()<cr>', {})

vim.keymap.set('n', '<leader>F', '<cmd>lua require("telescope.builtin").find_files()<cr>', {})
vim.keymap.set('n', '<leader>f.', '<cmd>lua require("telescope.builtin").resume()<cr>', {})
vim.keymap.set('n', '<leader>f;', '<cmd>lua require("telescope.builtin").commands()<cr>', {})
vim.keymap.set('n', '<leader>fb', '<cmd>lua require("telescope.builtin").buffers()<cr>', {})
vim.keymap.set('n', '<leader>fc', '<cmd>lua require("telescope.builtin").command_history()<cr>', {})
vim.keymap.set('n', '<leader>ff', '<cmd>lua require("telescope.builtin").git_files()<cr>', {})
vim.keymap.set('n', '<leader>fg', '<cmd>lua require("telescope.builtin").live_grep()<cr>', {})
vim.keymap.set('n', '<leader>fh', '<cmd>lua require("telescope.builtin").help_tags()<cr>', {})
vim.keymap.set('n', '<leader>fk', '<cmd>lua require("telescope.builtin").keymaps()<cr>', {})
vim.keymap.set('n', '<leader>fr', '<cmd>lua require("telescope.builtin").registers()<cr>', {})
vim.keymap.set('n', '<leader>fs', '<cmd>lua require("telescope.builtin").search_history()<cr>', {})
vim.keymap.set('n', '<leader>fi', '<cmd>lua require("telescope.builtin").current_buffer_fuzzy_find()<cr>', {})
vim.keymap.set('n', '<leader>fz', '<cmd>lua require("telescope").extensions.zoxide.list()<cr>', {})
