require 'nvim-treesitter.configs'.setup {
  ensure_installed = { 'c_sharp', 'lua', 'python' },
  sync_install = false,
  auto_install = false,
  ignore_install = {},
  highlight = {
    enable = true,
    disable = {},
    additional_vim_regex_highlighting = false,
  },
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = '<CR>',
      node_incremental = '<CR>',
      scope_incremental = '<S-CR>',
      node_decremental = '<BS>',
    },
  },
}
