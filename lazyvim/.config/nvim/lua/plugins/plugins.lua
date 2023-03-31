return {
  {
    "camgraff/telescope-tmux.nvim",
    dependencies = { "norcalli/nvim-terminal.lua" },
  },
  {
    "tidalcycles/vim-tidal",
    keys = { { "<localleader>ch", "<cmd>TidalHush<cr>", desc = "hush tidal", silent = false } },
  },
  {
    "jpalardy/vim-slime",
  },
  {
    "davidgranstrom/scnvim",
    config = function()
      require("scnvim").setup({})
    end,
  },
  {
    "mg979/vim-visual-multi",
  },
  {
    "kmonad/kmonad-vim",
  },
  {
    "akinsho/toggleterm.nvim",
    config = true,
    keys = { { [[<c-\>]], "<cmd>ToggleTerm<cr>", desc = "toggle terminal" } },
    opts = {
      open_mapping = [[<c-\>]],
      direction = "vertical",
      size = vim.o.columns * 0.35,
      shade_terminals = false,
    },
  },
  -- copy lazyvim config for null-ls and add black
  {
    "jose-elias-alvarez/null-ls.nvim",
    opts = function()
      local nls = require("null-ls")
      return {
        root_dir = require("null-ls.utils").root_pattern(".null-ls-root", ".neoconf.json", "Makefile", ".git"),
        sources = {
          nls.builtins.formatting.fish_indent,
          nls.builtins.diagnostics.fish,
          nls.builtins.formatting.stylua,
          nls.builtins.formatting.shfmt,
          nls.builtins.diagnostics.flake8,
          nls.builtins.formatting.black,
        },
      }
    end,
  },
}
