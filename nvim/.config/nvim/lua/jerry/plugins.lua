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

  use 'lewis6991/gitsigns.nvim'

  use 'junegunn/goyo.vim'

  use({ "windwp/nvim-autopairs" })

  use 'nvim-treesitter/nvim-treesitter'
  use 'nvim-lua/plenary.nvim'
  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.0',
    requires = { {'nvim-lua/plenary.nvim'} }
  }
  use "hrsh7th/nvim-cmp"
  use "hrsh7th/cmp-nvim-lsp"
  use "hrsh7th/cmp-buffer"
  use "hrsh7th/cmp-path"
  use "hrsh7th/cmp-cmdline"
  use "saadparwaiz1/cmp_luasnip"

  use "L3MON4D3/LuaSnip"
  use "rafamadriz/friendly-snippets"

  use "neovim/nvim-lspconfig"
  use "williamboman/nvim-lsp-installer"

  use 'arcticicestudio/nord-vim' 
  use({
    'catppuccin/nvim',
    as = 'catppuccin'
  })
end)
