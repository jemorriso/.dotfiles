vim.keymap.set('n', 'yr', '$', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>y', '"+y', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>p', '"+p', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>/', ':nohl<cr>', { noremap = true, silent = true })
vim.keymap.set("n", "<leader>e", "<cmd>NvimTreeToggle<CR>", {noremap = true, silent = true})
vim.keymap.set("n", "<leader>r", "<cmd>lua vim.lsp.buf.format({async=true})<CR>", {noremap = true, silent = true})

vim.keymap.set('n', '<leader>dc', [[:put =strftime('%A, %B %d, %Y')<cr>kJ]], { noremap = true, silent = true })
vim.keymap.set('n', '<leader>ic', ':source $MYVIMRC<cr>', { noremap = true, silent = true })

vim.keymap.set('n', '<leader>ff', '<cmd>lua require("telescope.builtin").find_files()<cr>', {})
vim.keymap.set('n', '<leader>fg', '<cmd>lua require("telescope.builtin").live_grep()<cr>', {})
vim.keymap.set('n', '<leader>fb', '<cmd>lua require("telescope.builtin").buffers()<cr>', {})
vim.keymap.set('n', '<leader>fh', '<cmd>lua require("telescope.builtin").help_tags()<cr>', {})

vim.keymap.set("n", "<leader>ti", "<cmd>lua _ipython_toggle()<CR>", {noremap = true, silent = true})

