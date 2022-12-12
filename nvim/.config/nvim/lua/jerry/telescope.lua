local telescope = require 'telescope'

telescope.setup {
  defaults = {
    file_ignore_patterns = { '.git' },
    path_display = { 'absolute' },
    wrap_results = true
  },
  pickers = {
    find_files = {
      hidden = true,
      no_ignore = true,
    },
    git_files = {
      show_untracked = true
    }
  },
}

telescope.load_extension('file_browser')
telescope.load_extension('zoxide')
