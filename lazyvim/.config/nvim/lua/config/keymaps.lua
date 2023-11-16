-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- vim.keymap.set("", "<localleader>y", '"+y', { noremap = true, silent = true })
-- vim.keymap.set("", "<localleader>p", '"+p', { noremap = true, silent = true })

local function map(mode, lhs, rhs, opts)
  local keys = require("lazy.core.handler").handlers.keys
  ---@cast keys LazyKeysHandler
  -- do not create the keymap if a lazy keys handler exists
  if not keys.active[keys.parse({ lhs, mode = mode }).id] then
    opts = opts or {}
    opts.silent = opts.silent ~= false
    vim.keymap.set(mode, lhs, rhs, opts)
  end
end

map("n", ",d", [[:put =strftime('%A, %B %d, %Y')<cr>kJ]], { desc = "Put date" })
map("n", ",t", [[:put =strftime('%T')<cr>kJ]], { desc = "Put time" })

map({ "n", "v" }, "<c-d>", "<c-d>zz")
map({ "n", "v" }, "<c-u>", "<c-u>zz")

map("n", "<A-down>", "<cmd>m .+1<cr>==", { desc = "Move down" })
map("n", "<A-up>", "<cmd>m .-2<cr>==", { desc = "Move up" })
map("i", "<A-down>", "<esc><cmd>m .+1<cr>==gi", { desc = "Move down" })
map("i", "<A-up>", "<esc><cmd>m .-2<cr>==gi", { desc = "Move up" })
map("v", "<A-down>", ":m '>+1<cr>gv=gv", { desc = "Move down" })
map("v", "<A-up>", ":m '<-2<cr>gv=gv", { desc = "Move up" })

map("n", "<S-left>", "<cmd>BufferLineCyclePrev<cr>", { desc = "Prev buffer" })
map("n", "<S-right>", "<cmd>BufferLineCycleNext<cr>", { desc = "Next buffer" })
