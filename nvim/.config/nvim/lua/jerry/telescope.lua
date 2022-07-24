local telescope = require "telescope"
local actions = require "telescope.actions"

telescope.setup {
  defaults = {
    file_ignore_patterns = {
      ".git",
      ".venv",
      "logs",
      "target",
    },
    prompt_prefix = " ",
    selection_caret = " ",
    path_display = { "smart" },
  },
  pickers = {
    find_files = {
      hidden = true
    },
  },
  extensions = {
  },
}
