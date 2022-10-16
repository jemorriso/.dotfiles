local null_ls = require 'null-ls'

local sources = {
  null_ls.builtins.formatting.black.with({ extra_args = { '--preview' } }),
  null_ls.builtins.diagnostics.flake8,
  null_ls.builtins.diagnostics.sqlfluff.with({
    extra_args = { '--dialect', 'postgres' },
  }),
  null_ls.builtins.formatting.sqlfluff.with({
    extra_args = { '--dialect', 'postgres' },
  }),
  null_ls.builtins.formatting.prettier,
}

null_ls.setup({ sources = sources })
