-- free up comma, semicolon keys - using clever-f
vim.keymap.set('', ',,', ',', { noremap = true, silent = true })
-- vim.keymap.set('', ';', ':', { noremap = true, silent = true })

vim.keymap.set('', '<leader>y', '"+y', { noremap = true, silent = true })
vim.keymap.set('', '<leader>p', '"+p', { noremap = true, silent = true })

vim.keymap.set('n', 'gr', '<cmd>lua require("telescope.builtin").lsp_references()<cr>', {})
vim.keymap.set('n', 'gs', '<cmd>lua require("telescope.builtin").lsp_workspace_symbols()<cr>', {})

vim.keymap.set('n', '<c-d>', '<c-d>zz', {})
vim.keymap.set('n', '<c-u>', '<c-u>zz', {})

vim.keymap.set('n', '<localleader>d', [[:put =strftime('%A, %B %d, %Y')<cr>kJ]], { noremap = true, silent = true })

vim.keymap.set('n', '<leader>/', ':nohl<cr>', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>h', '<c-w>h', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>j', '<c-w>j', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>k', '<c-w>k', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>l', '<c-w>l', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>r', '<cmd> lua vim.lsp.buf.format({async=true})<cr>', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>e', '<cmd>NvimTreeToggle<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>z', '<cmd>ZenMode<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>u', '<cmd>lua require("telescope.builtin").lsp_document_symbols()<cr>', {})
vim.keymap.set('n', '<leader>b', '<cmd>lua require("telescope.builtin").buffers()<cr>', {})

vim.keymap.set('n', '<leader>fd', '<cmd>lua require("telescope.builtin").diagnostics()<cr>', {})
vim.keymap.set('n', '<leader>fa', '<cmd>lua require("telescope.builtin").find_files()<cr>', {})
vim.keymap.set('n', '<leader>f.', '<cmd>lua require("telescope.builtin").resume()<cr>', {})
vim.keymap.set('n', '<leader>f;', '<cmd>lua require("telescope.builtin").commands()<cr>', {})
vim.keymap.set('n', '<leader>fc', '<cmd>lua require("telescope.builtin").command_history()<cr>', {})
vim.keymap.set('n', '<leader>ff', '<cmd>lua require("telescope.builtin").git_files()<cr>', {})
vim.keymap.set('n', '<leader>fg', '<cmd>lua require("telescope.builtin").live_grep()<cr>', {})
vim.keymap.set('n', '<leader>fh', '<cmd>lua require("telescope.builtin").help_tags()<cr>', {})
vim.keymap.set('n', '<leader>fk', '<cmd>lua require("telescope.builtin").keymaps()<cr>', {})
vim.keymap.set('n', '<leader>fr', '<cmd>lua require("telescope.builtin").registers()<cr>', {})
vim.keymap.set('n', '<leader>fs', '<cmd>lua require("telescope.builtin").search_history()<cr>', {})
vim.keymap.set('n', '<leader>fi', '<cmd>lua require("telescope.builtin").current_buffer_fuzzy_find()<cr>', {})
vim.keymap.set('n', '<leader>fz', '<cmd>lua require("telescope").extensions.zoxide.list()<cr>', {})
vim.keymap.set('n', '<leader>fe', '<cmd>lua require("telescope").extensions.file_browser.file_browser()<cr>', {})

vim.keymap.set('n', '[c', '<cmd>lua require("gitsigns").prev_hunk()<cr>', {})
vim.keymap.set('n', ']c', '<cmd>lua require("gitsigns").next_hunk()<cr>', {})
vim.keymap.set('n', ']m', ':tabm+1', {})
vim.keymap.set('n', '[m', ':tabm-1', {})
vim.keymap.set('n', ']b', ':bnext', {})
vim.keymap.set('n', '[b', ':bprev', {})

vim.keymap.set('n', '<leader>tt', ':ToggleTerm direction=tab<cr>', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>tv', ':ToggleTerm direction=vertical<cr>', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>ts', ':ToggleTerm direction=horizontal<cr>', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>tf', ':ToggleTerm direction=float<cr>', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>tg', '<cmd>lua _lazygit_toggle()<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>ti', '<cmd>lua _ipython_toggle()<CR>', { noremap = true, silent = true })
