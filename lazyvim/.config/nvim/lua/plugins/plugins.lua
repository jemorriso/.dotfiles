return {
  {
    "Pocco81/auto-save.nvim",
    config = function()
      require("auto-save").setup({
        execution_message = {
          message = function() -- message to print on save
            -- return ("AutoSave: saved at " .. vim.fn.strftime("%H:%M:%S"))
            return ""
          end,
          dim = 0.18, -- dim the color of `message`
          cleaning_interval = 1250, -- (milliseconds) automatically clean MsgArea after displaying `message`. See :h MsgArea
        },
      })
    end,
  },
  {
    "ellisonleao/gruvbox.nvim",
    opts = {
      contrast = "hard",
    },
    config = function()
      require("gruvbox").setup({
        -- this fixes the lighter colored background for signcolumn and around noice popup
        -- https://github.com/ellisonleao/gruvbox.nvim/issues/230
        overrides = {
          SignColumn = { link = "Normal" },
          -- WhichKey = { link = "Normal" },
          GruvboxGreenSign = { bg = "" },
          GruvboxOrangeSign = { bg = "" },
          GruvboxPurpleSign = { bg = "" },
          GruvboxYellowSign = { bg = "" },
          GruvboxRedSign = { bg = "" },
          GruvboxBlueSign = { bg = "" },
          GruvboxAquaSign = { bg = "" },
        },
      })
    end,
    -- version = false,
    -- commit = "df149bccb19a02c5c2b9fa6ec0716f0c0487feb0",
  },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "gruvbox",
    },
  },
  {
    "nvim-treesitter/nvim-treesitter",
    keys = {
      { "<cr>", desc = "Increment selection" },
      { "<bs>", desc = "Decrement selection", mode = "x" },
    },
    opts = {
      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = "<cr>",
          node_incremental = "<cr>",
          scope_incremental = "<s-cr>",
          node_decremental = "<bs>",
        },
      },
    },
    -- todo: this works but it is very slow. I can improve it
    -- config = function()
    --   vim.opt.foldmethod = "expr"
    --   vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
    --
    --   local api = vim.api
    --   local M = {}
    --   -- function to create a list of commands and convert them to autocommands
    --   -------- This function is taken from https://github.com/norcalli/nvim_utils
    --   function M.nvim_create_augroups(definitions)
    --     for group_name, definition in pairs(definitions) do
    --       api.nvim_command("augroup " .. group_name)
    --       api.nvim_command("autocmd!")
    --       for _, def in ipairs(definition) do
    --         local command = table.concat(vim.tbl_flatten({ "autocmd", def }), " ")
    --         api.nvim_command(command)
    --       end
    --       api.nvim_command("augroup END")
    --     end
    --   end
    --
    --   local autoCommands = {
    --     -- other autocommands
    --     open_folds = {
    --       { "BufReadPost,FileReadPost", "*", "normal zR" },
    --     },
    --   }
    --
    --   M.nvim_create_augroups(autoCommands)
    -- end,
  },
  {
    "L3MON4D3/LuaSnip",
    config = function()
      require("luasnip.loaders.from_vscode").lazy_load({
        paths = { "/Users/jerry/.dotfiles/lazyvim/.config/nvim/snippets/" },
      })
    end,
  },
  {
    "camgraff/telescope-tmux.nvim",
    dependencies = { "norcalli/nvim-terminal.lua" },
  },
  {
    "mfussenegger/nvim-dap-python",
    config = function()
      local dappy = require("dap-python")
      dappy.setup("~/.pyenv/versions/debugpy/bin/python")
    end,
  },
  {
    "nvim-neotest/neotest",
    opts = {
      adapters = { "neotest-python" },
    },
  },
  {
    "tidalcycles/vim-tidal",
    keys = {
      { "<localleader>h", "<cmd>TidalHush<cr>", desc = "hush tidal", silent = false },
      { "<localleader>l", "<cmd>TidalSend<cr>", desc = "tidal send line", silent = false },
      { "<localleader><space>", "<plug>TidalParagraphSend", desc = "tidal send paragraph", silent = false },
      -- { "<localleader>x", "<cmd>TidalSend1", desc = "tidal exec command", silent = false },
      { "<localleader>s1", "<cmd>TidalSilence 1<cr>", desc = "tidal silence stream", silent = false },
      { "<localleader>s2", "<cmd>TidalSilence 2<cr>", desc = "tidal silence stream", silent = false },
      { "<localleader>s3", "<cmd>TidalSilence 3<cr>", desc = "tidal silence stream", silent = false },
      { "<localleader>s4", "<cmd>TidalSilence 4<cr>", desc = "tidal silence stream", silent = false },
      { "<localleader>s5", "<cmd>TidalSilence 5<cr>", desc = "tidal silence stream", silent = false },
      { "<localleader>s6", "<cmd>TidalSilence 6<cr>", desc = "tidal silence stream", silent = false },
      { "<localleader>s7", "<cmd>TidalSilence 7<cr>", desc = "tidal silence stream", silent = false },
      { "<localleader>s8", "<cmd>TidalSilence 8<cr>", desc = "tidal silence stream", silent = false },
      { "<localleader>s9", "<cmd>TidalSilence 9<cr>", desc = "tidal silence stream", silent = false },
      { "<localleader>s0", "<cmd>TidalSilence 0<cr>", desc = "tidal silence stream", silent = false },
      { "<localleader>p1", "<cmd>TidalPlay 1<cr>", desc = "tidal play stream", silent = false },
      { "<localleader>p2", "<cmd>TidalPlay 2<cr>", desc = "tidal play stream", silent = false },
      { "<localleader>p3", "<cmd>TidalPlay 3<cr>", desc = "tidal play stream", silent = false },
      { "<localleader>p4", "<cmd>TidalPlay 4<cr>", desc = "tidal play stream", silent = false },
      { "<localleader>p5", "<cmd>TidalPlay 5<cr>", desc = "tidal play stream", silent = false },
      { "<localleader>p6", "<cmd>TidalPlay 6<cr>", desc = "tidal play stream", silent = false },
      { "<localleader>p7", "<cmd>TidalPlay 7<cr>", desc = "tidal play stream", silent = false },
      { "<localleader>p8", "<cmd>TidalPlay 8<cr>", desc = "tidal play stream", silent = false },
      { "<localleader>p9", "<cmd>TidalPlay 9<cr>", desc = "tidal play stream", silent = false },
      { "<localleader>p0", "<cmd>TidalPlay 10<cr>", desc = "tidal play stream", silent = false },
      { "<localleader><space>", "<plug>TidalRegionSend", mode = "v", desc = "tidal send selected", silent = false },
    },
    ft = "tidal",
    config = function()
      vim.g.tidal_no_mappings = 1
      vim.g.tidal_target = "terminal"
      -- vim.g.tidal_sc_enable = 1
    end,
  },
  {
    "jpalardy/vim-slime",
    config = function()
      vim.g.slime_target = "tmux"
    end,
  },
  {
    "davidgranstrom/scnvim",
    -- ft = "scd",
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
  -- {
  --   "williamboman/mason-lspconfig.nvim",
  --   config = function()
  --     require("mason-lspconfig").setup({
  --       ensure_installed = { "lua_ls", "pyright" },
  --     })
  --   end,
  -- },
  -- {
  --   "jay-babu/mason-nvim-dap.nvim",
  --   config = function()
  --     require("mason-nvim-dap").setup({
  --       ensure_installed = { "stylua", "jq" },
  --       handlers = {}, -- sets up dap in the predefined manner
  --     })
  --   end,
  -- },
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
    ft = { "ipynb", "py", "cs" },
    keys = {
      { "<localleader>x", "<cmd>JupyniumExecuteSelectedCells<cr>", desc = "Jupynium execute selected cells" },
      { "<localleader>s", "o# %%<esc>", desc = "Jupynium split cell below" },
      { "<localleader>S", "O# %%<esc>", desc = "Jupynium split cell above" },
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
        "<localleader>o",
        "<cmd>JupyniumToggleSelectedCellsOutputsScroll<cr>",
        desc = "Jupynium toggle selected cells auto-scroll",
      },
      {
        "<localleader><localleader>t",
        "<cmd>JupyniumStartAndAttachToServerInTerminal<cr>",
        desc = "Jupynium start and attach to server in terminal",
      },
      {
        "<localleader><localleader>s",
        "<cmd>JupyniumStartSync<cr>",
        desc = "Jupynium start syncing",
      },
      {
        "[j",
        "<cmd>lua require'jupynium.textobj'.goto_previous_cell_separator()<cr>",
        mode = { "n", "x", "o" },
        desc = "Jupynium go to previous cell",
      },
      {
        "]j",
        "<cmd>lua require'jupynium.textobj'.goto_next_cell_separator()<cr>",
        mode = { "n", "x", "o" },
        desc = "Jupynium go to next cell",
      },
      {
        "<localleader>k",
        "<cmd>lua require'jupynium.textobj'.goto_current_cell_separator()<cr>",
        mode = { "n", "x", "o" },
        desc = "Jupynium go to current cell",
      },
      {
        "aj",
        "<cmd>lua require'jupynium.textobj'.select_cell(true, false)<cr>",
        mode = { "x", "o" },
        desc = "Jupynium select around cell",
      },
      {
        "ij",
        "<cmd>lua require'jupynium.textobj'.select_cell(false, false)<cr>",
        mode = { "x", "o" },
        desc = "Jupynium select inside cell",
      },
      {
        "aJ",
        "<cmd>lua require'jupynium.textobj'.select_cell(true, true)<cr>",
        mode = { "x", "o" },
        desc = "Jupynium select around cell (include next cell separator)",
      },
      {
        "iJ",
        "<cmd>lua require'jupynium.textobj'.select_cell(false, true)<cr>",
        mode = { "x", "o" },
        desc = "Jupynium select inside cell (include next cell separator)",
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
