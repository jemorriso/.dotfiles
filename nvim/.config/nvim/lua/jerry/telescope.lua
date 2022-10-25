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
    git_files = {
      show_untracked = true
    }
  },
}

telescope.load_extension('file_browser')
telescope.load_extension('zoxide')
