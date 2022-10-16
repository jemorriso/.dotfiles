local telescope = require 'telescope'
local actions = require 'telescope.actions'

telescope.setup {
  defaults = {
    file_ignore_patterns = { '.git' },
    path_display = { 'smart' },
  },
  pickers = {
    find_files = {
      hidden = true
    },
  },
  extensions = {
  },
}
