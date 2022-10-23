local null_ls = require 'null-ls'

local sources = {
  -- if I'm using a virtualenv I've found that these need to be installed in that virtualenv
  null_ls.builtins.formatting.black.with({ extra_args = { '--preview' } }),
  null_ls.builtins.formatting.isort,
  null_ls.builtins.diagnostics.flake8,

  null_ls.builtins.diagnostics.sqlfluff.with({
    extra_args = { '--dialect', 'postgres' },
  }),
  null_ls.builtins.formatting.sqlfluff.with({
    extra_args = { '--dialect', 'postgres' },
  }),
  null_ls.builtins.formatting.prettier,
}

null_ls.setup({
  sources = sources,
  should_attach = function(bufnr)
    -- hyphen is magic character in lua pattern, needs to be escaped with %
    -- note that lua DOES NOT have regex
    return not vim.api.nvim_buf_get_name(bufnr):match([[^/Users/jerry/source/prop%-bot/.*%.sql$]])
  end,
})
