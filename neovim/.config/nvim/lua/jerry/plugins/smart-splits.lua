return {
  'mrjones2014/smart-splits.nvim',
  config = function()
    require('smart-splits').setup {
      resize_mode = {
        resize_keys = { 'm', 'n', 'e', 'i' },
      },
    }
  end,
  keys = {
    { '<localleader>r', [[<cmd>lua require("smart-splits").start_resize_mode()<cr>]], desc = 'enter resize mode' },
    { '<A-m>', [[<cmd>lua require("smart-splits").move_cursor_left()<cr>]], desc = 'move cursor left' },
    { '<A-n>', [[<cmd>lua require("smart-splits").move_cursor_down()<cr>]], desc = 'move cursor down' },
    { '<A-e>', [[<cmd>lua require("smart-splits").move_cursor_up()<cr>]], desc = 'move cursor up' },
    { '<A-i>', [[<cmd>lua require("smart-splits").move_cursor_right()<cr>]], desc = 'move cursor right' },
    { '<C-A-m>', [[<cmd>lua require("smart-splits").resize_left()<cr>]], desc = 'resize left' },
    { '<C-A-n>', [[<cmd>lua require("smart-splits").resize_down()<cr>]], desc = 'resize down' },
    { '<C-A-e>', [[<cmd>lua require("smart-splits").resize_up()<cr>]], desc = 'resize up' },
    { '<C-A-i>', [[<cmd>lua require("smart-splits").resize_right()<cr>]], desc = 'resize right' },
    {
      '<S-A-m>',
      [[<cmd>lua require("smart-splits").swap_buf_left({ move_cursor = true })<cr>]],
      desc = 'resize left',
    },
    {
      '<S-A-n>',
      [[<cmd>lua require("smart-splits").swap_buf_down({ move_cursor = true })<cr>]],
      desc = 'resize down',
    },
    { '<S-A-e>', [[<cmd>lua require("smart-splits").swap_buf_up({ move_cursor = true })<cr>]], desc = 'resize up' },
    {
      '<S-A-i>',
      [[<cmd>lua require("smart-splits").swap_buf_right({ move_cursor = true })<cr>]],
      desc = 'resize right',
    },
  },
}
