return {
  {
    "camgraff/telescope-tmux.nvim",
    dependencies = { "norcalli/nvim-terminal.lua" },
  },
  {
    "tidalcycles/vim-tidal",
    keys = {
      { "<localleader>th", "<cmd>TidalHush<cr>", desc = "hush tidal", silent = false },
      { "<localleader>th", "<cmd>TidalHush<cr>", desc = "hush tidal", silent = false },
      { "<localleader>tp", "<plug>TidalParagraphSend", desc = "tidal send paragraph", silent = false },
    },
    ft = "tidal",
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
    ft = "scd",
  },
  {
    "mg979/vim-visual-multi",
  },
  {
    "kmonad/kmonad-vim",
    ft = "kbd",
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
    lazy = false,
  },
  {
    "jose-elias-alvarez/null-ls.nvim",
    opts = function(_, opts)
      local nls = require("null-ls")
      table.insert(opts.sources, nls.builtins.formatting.black)
      table.insert(opts.sources, nls.builtins.diagnostics.flake8)
    end,
  },
  {
    "kiyoon/jupynium.nvim",
    build = "pip3 install --user .",
    config = function()
      local jupynium = require("jupynium")
      jupynium.setup({
        use_default_keybindings = false,
        textobjects = {
          use_default_keybindings = false,
        },
      })
    end,
    ft = { "ipynb", "py" },
    keys = {
      { ",x", "<cmd>JupyniumExecuteSelectedCells<cr>", desc = "Jupynium execute selected cells" },
      { ",s", "o# %%<esc>", desc = "Jupynium split cell below" },
      { ",S", "O# %%<esc>", desc = "Jupynium split cell above" },
      -- not needed right now
      -- {
      --   ",f",
      --   "<cmd>JupyniumScrollToCell<cr>",
      --   desc = "Jupynium focus cell",
      -- },
      -- not working
      -- {
      --   ",a",
      --   "<cmd>JupyniumAutoscrollToggle<cr>",
      --   desc = "Jupynium toggle auto-scroll",
      -- },
      {
        ",o",
        "<cmd>JupyniumToggleSelectedCellsOutputsScroll<cr>",
        desc = "Jupynium toggle selected cells auto-scroll",
      },
      {
        ",,t",
        "<cmd>JupyniumStartAndAttachToServerInTerminal<cr>",
        desc = "Jupynium start and attach to server in terminal",
      },
      {
        ",,s",
        "<cmd>JupyniumStartSync<cr>",
        desc = "Jupynium start syncing",
      },
      -- not needed right now
      -- {
      --   "<C-A-d>",
      --   "<cmd>JupyniumScrollDown<cr>",
      --   desc = "Jupynium scroll down",
      -- },
      -- {
      --   "<C-A-u>",
      --   "<cmd>JupyniumScrollUp<cr>",
      --   desc = "Jupynium scroll up",
      -- },
    },
  },
}
