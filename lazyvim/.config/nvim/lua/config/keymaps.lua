-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

vim.keymap.set("", "<localleader>y", '"+y', { noremap = true, silent = true })
vim.keymap.set("", "<localleader>p", '"+p', { noremap = true, silent = true })

vim.keymap.set("n", "<localleader>d", [[:put =strftime('%A, %B %d, %Y')<cr>kJ]], { noremap = true, silent = true })
vim.keymap.set("n", "<localleader>t", [[:put =strftime('%T')<cr>kJ]], { noremap = true, silent = true })
