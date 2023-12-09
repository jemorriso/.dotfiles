return {
  -- TODO this is not working
  -- {
  --   "nvim-telescope/telescope-frecency.nvim",
  --   config = function()
  --     require("telescope").load_extension("frecency")
  --   end,
  --   keys = {
  --     { "<leader>zz", ":Telescope frecency workspace=CWD<cr>", desc = "frecency" },
  --   },
  -- },
  {
    "nvim-telescope/telescope-smart-history.nvim",
    dependencies = { "nvim-telescope/telescope.nvim", "kkharji/sqlite.lua" },
  },
  {
    "nvim-telescope/telescope.nvim",
    config = function()
      local actions = require("telescope.actions")
      require("telescope").setup({
        defaults = {
          mappings = {
            i = {
              ["<C-down>"] = actions.cycle_history_next,
              ["<C-up>"] = actions.cycle_history_prev,
              ["<C-n>"] = actions.cycle_history_next,
              ["<C-p>"] = actions.cycle_history_prev,
            },
          },
          history = {
            path = "~/.local/share/nvim/databases/telescope_history.sqlite3",
            limit = 100,
          },
        },
      })
      require("telescope").load_extension("smart_history")
    end,
  },
  {
    "folke/zen-mode.nvim",
    keys = {
      { "<localleader>z", "<cmd>ZenMode<cr>", desc = "toggle zen mode" },
      {
        "<localleader>f",
        [[<cmd>lua require("zen-mode").toggle({ window = { width = 1, height = 1 }, plugins = { gitsigns = { enabled = false }, }, })<cr>]],
        desc = "toggle zen mode",
      },
    },
    opts = {
      plugins = {
        gitsigns = { enabled = true },
      },
    },
  },
  {
    "echasnovski/mini.nvim",
    version = false,
    config = function()
      require("mini.align").setup()
    end,
  },
  {
    "mrjones2014/smart-splits.nvim",
    config = function()
      require("smart-splits").setup({
        resize_mode = {
          resize_keys = { "m", "n", "e", "i" },
        },
      })
      -- vim.keymap.set("n", "<C-left>", require("smart-splits").move_cursor_left)
      -- vim.keymap.set("n", "<C-down>", require("smart-splits").move_cursor_down)
      -- vim.keymap.set("n", "<C-up>", require("smart-splits").move_cursor_up)
      -- vim.keymap.set("n", "<C-right>", require("smart-splits").move_cursor_right)
    end,
    keys = {
      { "<localleader>r", [[<cmd>lua require("smart-splits").start_resize_mode()<cr>]], desc = "enter resize mode" },
      { "<A-m>", [[<cmd>lua require("smart-splits").move_cursor_left()<cr>]], desc = "move cursor left" },
      { "<A-n>", [[<cmd>lua require("smart-splits").move_cursor_down()<cr>]], desc = "move cursor down" },
      { "<A-e>", [[<cmd>lua require("smart-splits").move_cursor_up()<cr>]], desc = "move cursor up" },
      { "<A-i>", [[<cmd>lua require("smart-splits").move_cursor_right()<cr>]], desc = "move cursor right" },
      { "<C-A-m>", [[<cmd>lua require("smart-splits").resize_left()<cr>]], desc = "resize left" },
      { "<C-A-n>", [[<cmd>lua require("smart-splits").resize_down()<cr>]], desc = "resize down" },
      { "<C-A-e>", [[<cmd>lua require("smart-splits").resize_up()<cr>]], desc = "resize up" },
      { "<C-A-i>", [[<cmd>lua require("smart-splits").resize_right()<cr>]], desc = "resize right" },
      {
        "<S-A-m>",
        [[<cmd>lua require("smart-splits").swap_buf_left({ move_cursor = true })<cr>]],
        desc = "resize left",
      },
      {
        "<S-A-n>",
        [[<cmd>lua require("smart-splits").swap_buf_down({ move_cursor = true })<cr>]],
        desc = "resize down",
      },
      { "<S-A-e>", [[<cmd>lua require("smart-splits").swap_buf_up({ move_cursor = true })<cr>]], desc = "resize up" },
      {
        "<S-A-i>",
        [[<cmd>lua require("smart-splits").swap_buf_right({ move_cursor = true })<cr>]],
        desc = "resize right",
      },
    },
  },
  {
    "zbirenbaum/copilot.lua",
    opts = {
      suggestion = { enabled = true },
      panel = { enabled = true },
      filetypes = {
        markdown = true,
        help = true,
        python = true,
      },
    },
  },
  {
    "jackMort/ChatGPT.nvim",
    event = "VeryLazy",
    config = function()
      require("chatgpt").setup({
        -- api_key_cmd = "op read op://Personal/OpenAI/credential",
        openai_params = {
          model = "gpt-4",
        },
      })
    end,
    dependencies = {
      "MunifTanjim/nui.nvim",
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope.nvim",
    },
    keys = {
      { "<localleader>c", "<cmd>ChatGPT<cr>", desc = "toggle chatgpt" },
    },
  },
  {
    "epwalsh/obsidian.nvim",
    config = function()
      require("obsidian").setup({
        disable_frontmatter = true,
      })
    end,
    lazy = true,
    event = {
      -- If you want to use the home shortcut '~' here you need to call 'vim.fn.expand'.
      -- E.g. "BufReadPre " .. vim.fn.expand "~" .. "/my-vault/**.md"
      "BufReadPre /Users/jerry/Documents/docs/**.md",
      "BufNewFile /Users/jerry/Documents/docs/**.md",
    },
    dependencies = {
      -- Required.
      "nvim-lua/plenary.nvim",
      "hrsh7th/nvim-cmp",
      "nvim-telescope/telescope.nvim",
    },
    opts = {
      dir = "/Users/jerry/Documents/docs", -- no need to call 'vim.fn.expand' here
    },
    keys = {
      { "<localleader>f", "<cmd>ObsidianFollowLink<cr>", desc = "obsidian follow link" },
      {
        "<localleader>td",
        [[<cmd>lua require("obsidian").util.toggle_checkbox()<cr>]],
        desc = "obsidian toggle checkbox",
      },
      { "<localleader>ot", [[<cmd>execute "normal! i\[\[" . strftime("%Y-%m-%d") . "\]\]"<cr>]] },
    },
  },
  {
    "fladson/vim-kitty",
  },
  -- {
  --   "glacambre/firenvim",
  --   -- Lazy load firenvim
  --   -- Explanation: https://github.com/folke/lazy.nvim/discussions/463#discussioncomment-4819297
  --   cond = not not vim.g.started_by_firenvim,
  --   build = function()
  --     require("lazy").load({ plugins = "firenvim", wait = true })
  --     vim.fn["firenvim#install"](0)
  --   end,
  -- },
  {
    "nvim-neo-tree/neo-tree.nvim",
    opts = {
      filesystem = {
        filtered_items = {
          hide_dotfiles = false,
        },
      },
    },
  },
  --{
  --   "Pocco81/auto-save.nvim",
  --   config = function()
  --     require("auto-save").setup({
  --       debounce_delay = 1000,
  --       execution_message = {
  --         message = function() -- message to print on save
  --           -- return ("AutoSave: saved at " .. vim.fn.strftime("%H:%M:%S"))
  --           return ""
  --         end,
  --         dim = 0.18, -- dim the color of `message`
  --         cleaning_interval = 1250, -- (milliseconds) automatically clean MsgArea after displaying `message`. See :h MsgArea
  --       },
  --     })
  --   end,
  -- },
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
      colorscheme = "tokyonight-storm",
      -- colorscheme = "gruvbox",
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
    "mfussenegger/nvim-dap-python",
  },
  {
    "nvim-neotest/neotest-python",
  },
  {
    "nvim-neotest/neotest",
    config = function()
      require("neotest").setup({
        adapters = { require("neotest-python") },
      })
    end,
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
      -- vim.g.slime_target = "tmux"
      -- vim.g.slime_target = "neovim"
      -- vim.g.slime_target = "kitty"
      vim.g.slime_target = "zellij"
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
    keys = {
      { "<C-A-down>", "<plug>(VM-Add-Cursor-Down)", desc = "foo", silent = false },
      { "<C-A-up>", "<plug>(VM-Add-Cursor-Up)", desc = "foo", silent = false },
    },
  },
  {
    "kmonad/kmonad-vim",
    ft = "kbd",
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
}
