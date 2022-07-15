local status_ok, telescope = pcall(require, "telescope")
if not status_ok then
  return
end

local actions = require "telescope.actions"

telescope.setup({
  defaults = { 
    file_ignore_patterns = { 
      ".git" 
    },
  },
  pickers = { 
    find_files = { 
      hidden = true 
    },
  },
  entry_prefix = "g ",
  prompt_prefix = "f ",
})
