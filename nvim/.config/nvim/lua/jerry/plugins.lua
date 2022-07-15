-- returns the require for use in `config` parameter of packer's use
-- expects the name of the config file
function get_config(name)
	-- return string.format('require("config/%s")', name)
	return string.format('require("%s")', name)
end

require('packer').startup(function()
  use 'wbthomason/packer.nvim'

  use 'tpope/vim-repeat'
  use 'tpope/vim-surround'
  use 'tpope/vim-commentary'
  use 'tpope/vim-fugitive'

  use 'junegunn/goyo.vim'

  use 'nvim-treesitter/nvim-treesitter'
  use 'nvim-lua/plenary.nvim'
  use 'nvim-telescope/telescope.nvim'
  
  use 'arcticicestudio/nord-vim' 
  use({
    'catppuccin/nvim',
    as = 'catppuccin'
  })
end)
