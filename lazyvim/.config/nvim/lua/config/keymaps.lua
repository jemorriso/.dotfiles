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

map("n", "<C-A-j>", "<cmd>m .+1<cr>==", { desc = "Move down" })
map("n", "<C-A-k>", "<cmd>m .-2<cr>==", { desc = "Move up" })
map("i", "<C-A-j>", "<esc><cmd>m .+1<cr>==gi", { desc = "Move down" })
map("i", "<C-A-k>", "<esc><cmd>m .-2<cr>==gi", { desc = "Move up" })
map("v", "<C-A-j>", ":m '>+1<cr>gv=gv", { desc = "Move down" })
map("v", "<C-A-k>", ":m '<-2<cr>gv=gv", { desc = "Move up" })

-- map("n", "<C-left>", "<C-w>h", { desc = "Go to left window", remap = true })
-- map("n", "<C-down>", "<C-w>j", { desc = "Go to lower window", remap = true })
-- map("n", "<C-up>", "<C-w>k", { desc = "Go to upper window", remap = true })
-- map("n", "<C-right>", "<C-w>l", { desc = "Go to right window", remap = true })

map("n", "<S-left>", "<cmd>BufferLineCyclePrev<cr>", { desc = "Prev buffer" })
map("n", "<S-right>", "<cmd>BufferLineCycleNext<cr>", { desc = "Next buffer" })

map("n", "<C-left>", require("smart-splits").move_cursor_left, { desc = "Move cursor left" })
map("n", "<C-down>", require("smart-splits").move_cursor_down, { desc = "Move cursor down" })
map("n", "<C-up>", require("smart-splits").move_cursor_up, { desc = "Move cursor up" })
map("n", "<C-right>", require("smart-splits").move_cursor_right, { desc = "Move cursor right" })
