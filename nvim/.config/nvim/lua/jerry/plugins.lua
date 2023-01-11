require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'

  use {
    'folke/zen-mode.nvim',
    config = function()
      require('zen-mode').setup({
        window = {
          width = 1,
          height = 1,
          options = {
            relativenumber = true
          }
        }
      })
    end
  }

  -- use {
  --   'stevearc/oil.nvim',
  --   config = function()
  --     require('oil').setup()
  --   end
  -- }

  use({ 'windwp/nvim-autopairs' })
  use {
    'numToStr/Comment.nvim',
    config = function()
      require('Comment').setup()
    end
  }
  use({
    'kylechui/nvim-surround',
    tag = '*',
    config = function()
      require('nvim-surround').setup({})
    end
  })
  use 'chaoren/vim-wordmotion'

  use {
    'ggandor/leap.nvim',
    config = function()
      require('leap').add_default_mappings()
    end
  }
  use {
    'ggandor/flit.nvim',
    config = function()
      require('flit').setup()
    end
  }

  -- use {
  --   'dkendal/nvim-treeclimber',
  --   requires = { 'rktjmp/lush.nvim' },
  --   config = function()
  --     require('nvim-treeclimber').setup()
  --   end
  -- }

  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'nvim-tree/nvim-web-devicons', opt = true },
    config = function()
      require('lualine').setup()
    end
  }

  use 'akinsho/toggleterm.nvim'
  use 'jpalardy/vim-slime'

  use {
    'lewis6991/gitsigns.nvim',
    config = function()
      require('gitsigns').setup()
    end
  }

  use 'L3MON4D3/LuaSnip'
  use 'rafamadriz/friendly-snippets'

  use 'hrsh7th/nvim-cmp'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-cmdline'
  use 'saadparwaiz1/cmp_luasnip'
  use 'f3fora/cmp-spell'

  use 'williamboman/mason.nvim'
  use 'williamboman/mason-lspconfig.nvim'
  use 'neovim/nvim-lspconfig'
  use 'jose-elias-alvarez/null-ls.nvim'
  use 'mfussenegger/nvim-dap'

  use 'nvim-treesitter/nvim-treesitter'
  use 'nvim-lua/plenary.nvim'

  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.0',
    requires = { { 'nvim-lua/plenary.nvim' } }
  }
  use { 'nvim-telescope/telescope-file-browser.nvim' }
  use 'jvgrootveld/telescope-zoxide'
  use {
    'camgraff/telescope-tmux.nvim',
    requires = { { 'norcalli/nvim-terminal.lua' } }
  }

  use 'shaunsingh/nord.nvim'
  use {
    'catppuccin/nvim',
    as = 'catppuccin',
    config = function()
      vim.g.catppuccin_flavour = 'macchiato' -- latte, frappe, macchiato, mocha
      require('catppuccin').setup()
    end
  }
  use 'folke/tokyonight.nvim'
  use 'rebelot/kanagawa.nvim'
end)
