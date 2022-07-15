require 'jerry.options'
require 'jerry.mappings'
require 'jerry.plugins'

require('telescope').setup{
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
}
