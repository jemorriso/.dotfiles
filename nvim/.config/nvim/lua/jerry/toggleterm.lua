local toggleterm = require 'toggleterm'
local Terminal = require('toggleterm.terminal').Terminal

toggleterm.setup({
  size = function(term)
    if term.direction == 'horizontal' then
      return 20
    elseif term.direction == 'vertical' then
      return vim.o.columns * 0.4
    end
  end,
  open_mapping = [[<c-\>]],
  start_in_insert = false,
  shade_terminals = false,
  direction = 'tab',
})

local lazygit = Terminal:new({
  cmd = 'lazygit',
  -- set hidden so it doesn't toggle on normal toggle commands
  hidden = true,
  direction = 'tab'
})

local ipython = Terminal:new({
  cmd = 'ipython',
  -- set hidden so it doesn't toggle on normal toggle commands
  hidden = true,
  direction = 'vertical'
})

function _lazygit_toggle()
  lazygit:toggle()
end

function _ipython_toggle()
  ipython:toggle()
end
