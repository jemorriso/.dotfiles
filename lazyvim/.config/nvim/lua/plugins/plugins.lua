return {
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
  },
--  {
--    "nvim-neotest/neotest-python",
--  },
--  {
--    "nvim-neotest/neotest",
--    config = function()
--      require("neotest").setup({
--        adapters = { require("neotest-python") },
--      })
--    end,
--  },
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
      vim.g.slime_target = "neovim"
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
    config = function()
      local tog = require("toggleterm")
      local Terminal = require("toggleterm.terminal").Terminal

      local pgcli = Terminal:new({
        cmd = "pgcli --pgclirc /Users/jerry/.dotfiles/pgcli/.config/pgcli/toggleterm-config",
        -- hidden = true,
        direction = "vertical",
        count = 99,
      })
      function _pgcli_toggle()
        pgcli:toggle()
      end

      local ipython = Terminal:new({
        cmd = "ipython",
        -- hidden = true,
        direction = "vertical",
        count = 98,
        -- on_open = function()
        --   vim.cmd("startinsert!")
        -- end,
      })
      function _ipython_toggle()
        ipython:toggle()
      end

      local nnn = Terminal:new({
        cmd = "n",
        -- hidden = true,
        direction = "float",
        count = 97,
      })
      function _nnn_toggle()
        nnn:toggle()
      end

      function _toggle_with_size(factor, direction)
        local f
        if direction == "vertical" then
          f = vim.o.columns * factor
        else
          f = vim.o.lines * factor
        end

        vim.cmd(string.format("ToggleTerm size=%s direction=%s", f, direction))
      end

      -- for some reason it didn't work to have these options specified under 'opts' after I added the above custom terminals, so I moved them in here
      tog.setup({
        -- note that the open mapping can also be prefixed!
        open_mapping = [[<c-\>]],
        direction = "vertical",
        size = function(term)
          if term.direction == "horizontal" then
            return 15
          elseif term.direction == "vertical" then
            return vim.o.columns * 0.4
          end
        end,
        shade_terminals = false,
        start_in_insert = false,
        insert_mappings = true,
        terminal_mappings = true,
      })
    end,
    keys = {
      { "<localleader>tt", "<cmd>ToggleTermToggleAll<cr>", desc = "toggle all terminals" },
      { "<localleader>tf", "<cmd>ToggleTerm direction=float<cr>", desc = "float terminal" },
      { "<localleader>th", "<cmd>ToggleTerm direction=horizontal<cr>", desc = "horizontal terminal" },
      { "<localleader>tv", "<cmd>ToggleTerm direction=vertical<cr>", desc = "vertical terminal" },
      { "<localleader>ta", "<cmd>ToggleTerm direction=tab<cr>", desc = "vertical terminal" },
      { "<localleader>t1", "<cmd>lua _toggle_with_size(0.25, 'vertical')<cr>", desc = "vertical terminal 0.25" },
      { "<localleader>t2", "<cmd>lua _toggle_with_size(0.5, 'vertical')<cr>", desc = "vertical terminal 0.5" },
      { "<localleader>t3", "<cmd>lua _toggle_with_size(0.75, 'vertical')<cr>", desc = "vertical terminal 0.75" },
      { "<localleader>t4", "<cmd>lua _toggle_with_size(1, 'vertical')<cr>", desc = "vertical terminal 1" },
      { "<localleader>th1", "<cmd>lua _toggle_with_size(0.25, 'horizontal')<cr>", desc = "horizontal terminal 0.25" },
      { "<localleader>th2", "<cmd>lua _toggle_with_size(0.5, 'horizontal')<cr>", desc = "horizontal terminal 0.5" },
      { "<localleader>th3", "<cmd>lua _toggle_with_size(0.75, 'horizontal')<cr>", desc = "horizontal terminal 0.75" },
      { "<localleader>th4", "<cmd>lua _toggle_with_size(1, 'horizontal')<cr>", desc = "horizontal terminal 1" },
      -- { "<localleader>t2", "<cmd>ToggleTerm size=100<cr>", desc = "terminal size 100" },
      -- { "<localleader>t3", "<cmd>ToggleTerm size=150<cr>", desc = "terminal size 150" },
      -- { "<localleader>t4", "<cmd>ToggleTerm size=200<cr>", desc = "terminal size 200" },
      { "<a-1>", "<cmd>1ToggleTerm<cr>", desc = "toggle terminal 1" },
      { "<a-2>", "<cmd>2ToggleTerm<cr>", desc = "toggle terminal 2" },
      { "<a-3>", "<cmd>3ToggleTerm<cr>", desc = "toggle terminal 3" },
      { "<a-p>", "<cmd>lua _pgcli_toggle()<cr>", desc = "pgcli toggle" },
      { "<a-i>", "<cmd>lua _ipython_toggle()<cr>", desc = "ipython toggle" },
      { "<a-n>", "<cmd>lua _nnn_toggle()<cr>", desc = "nnn toggle" },
      { "<localleader>ll", "<cmd>ToggleTermSendCurrentLine<cr>", desc = "send current line to terminal 1" },
      { "<localleader>l1", "<cmd>ToggleTermSendCurrentLine 1<cr>", desc = "send current line to terminal 1" },
      { "<localleader>l2", "<cmd>ToggleTermSendCurrentLine 2<cr>", desc = "send current line to terminal 2" },
      { "<localleader>l3", "<cmd>ToggleTermSendCurrentLine 3<cr>", desc = "send current line to terminal 3" },
      { "<localleader>li", "<cmd>ToggleTermSendCurrentLine 98<cr>", desc = "send current line to ipython" },
      { "<localleader>lp", "<cmd>ToggleTermSendCurrentLine 99<cr>", desc = "send current line to pgcli" },
      { "<localleader>ln", "<cmd>ToggleTermSendCurrentLine 97<cr>", desc = "send current line to nnn" },
      { "<localleader>vv", "<cmd>ToggleTermSendVisualLines<cr>", desc = "send visual lines to terminal 1", mode = "v" },
      {
        "<localleader>v1",
        "<cmd>ToggleTermSendVisualLines 1<cr>",
        desc = "send visual lines to terminal 1",
        mode = "v",
      },
      {
        "<localleader>v2",
        "<cmd>ToggleTermSendVisualLines 2<cr>",
        desc = "send visual lines to terminal 2",
        mode = "v",
      },
      {
        "<localleader>v3",
        "<cmd>ToggleTermSendVisualLines 3<cr>",
        desc = "send visual lines to terminal 3",
        mode = "v",
      },
      { "<localleader>vi", "<cmd>ToggleTermSendVisualLines 98<cr>", desc = "send visual lines to ipython", mode = "v" },
      { "<localleader>vp", "<cmd>ToggleTermSendVisualLines 99<cr>", desc = "send visual lines to pgcli", mode = "v" },
      { "<localleader>vn", "<cmd>ToggleTermSendVisualLines 97<cr>", desc = "send visual lines to nnn", mode = "v" },
      {
        "<localleader>ss",
        "<cmd>ToggleTermSendVisualSelection<cr>",
        desc = "send visual selection to terminal 1",
        mode = "v",
      },
      {
        "<localleader>s1",
        "<cmd>ToggleTermSendVisualSelection 1<cr>",
        desc = "send visual selection to terminal 1",
        mode = "v",
      },
      {
        "<localleader>s2",
        "<cmd>ToggleTermSendVisualSelection 2<cr>",
        desc = "send visual selection to terminal 2",
        mode = "v",
      },
      {
        "<localleader>s3",
        "<cmd>ToggleTermSendVisualSelection 3<cr>",
        desc = "send visual selection to terminal 3",
        mode = "v",
      },
      {
        "<localleader>si",
        "<cmd>ToggleTermSendVisualSelection 98<cr>",
        desc = "send visual selection to ipython",
        mode = "v",
      },
      {
        "<localleader>sp",
        "<cmd>ToggleTermSendVisualSelection 99<cr>",
        desc = "send visual selection to pgcli",
        mode = "v",
      },
      {
        "<localleader>sn",
        "<cmd>ToggleTermSendVisualSelection 97<cr>",
        desc = "send visual selection to nnn",
        mode = "v",
      },
    },
    lazy = false,
  },
  {
    "jose-elias-alvarez/null-ls.nvim",
    opts = function(_, opts)
      local nls = require("null-ls")
      table.insert(opts.sources, nls.builtins.diagnostics.flake8)
      table.insert(opts.sources, nls.builtins.formatting.black)
      -- table.insert(opts.sources, nls.builtins.diagnostics.sqlfluff.with({ extra_args = { "--dialect", "postgres" } }))
      -- table.insert(opts.sources, nls.builtins.formatting.sqlfluff.with({ extra_args = { "--dialect", "postgres" } }))
      -- table.insert(opts.sources, nls.builtins.diagnostics.sqlfluff)
      -- table.insert(opts.sources, nls.builtins.formatting.sqlfluff)
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
}
