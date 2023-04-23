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
      local scnvim = require("scnvim")
      local map = scnvim.map
      local map_expr = scnvim.map_expr
      scnvim.setup({
        keymaps = {
          ["<M-e>"] = map("editor.send_line", { "i", "n" }),
          ["<C-e>"] = {
            map("editor.send_block", { "i", "n" }),
            map("editor.send_selection", "x"),
          },
          ["<CR>"] = map("postwin.toggle"),
          ["<M-CR>"] = map("postwin.toggle", "i"),
          ["<M-L>"] = map("postwin.clear", { "n", "i" }),
          ["<C-k>"] = map("signature.show", { "n", "i" }),
          ["<F12>"] = map("sclang.hard_stop", { "n", "x", "i" }),
          ["<leader>st"] = map("sclang.start"),
          ["<leader>sk"] = map("sclang.recompile"),
          ["<F1>"] = map_expr("s.boot"),
          ["<F2>"] = map_expr("s.meter"),
        },
        editor = {
          highlight = {
            color = "IncSearch",
          },
        },
        postwin = {
          float = {
            enabled = true,
          },
        },
      })
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
