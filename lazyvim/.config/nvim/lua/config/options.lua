-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

vim.opt.number = false
vim.opt.relativenumber = false

vim.opt.cmdheight = 1

vim.g.maplocalleader = [[;]]

vim.g.slime_target = "tmux"

vim.g.tidal_no_mappings = 1
vim.g.tidal_target = "tmux"
vim.g.tidal_default_config = { socket_name = "default", target_pane = ":.1" }
