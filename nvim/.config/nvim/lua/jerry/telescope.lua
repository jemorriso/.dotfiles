local telescope = require 'telescope'

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
}

telescope.load_extension('zoxide')
