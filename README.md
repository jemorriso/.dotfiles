## log

### Saturday, October 15, 2022

- I'm not sure what's going on with packer `config` function setup for comment.nvim and nvim-surround
  - why do I need to call the setup function as a separate `require` to get it to work?

#### update Wednesday, October 19, 2022

- if I use the `config` property I need to call `:PackerCompile`

### Sunday, October 16, 2022

- null-ls sometimes won't attach formatters on file open? For sqlfluff and prettier it didn't work but for black it did...
  oooo
  - put `<leader>r` format command outside `on_attach` function for this reason
  - using lua command `:lua vim.lsp.buf.format... ` causes the formatter to attach for some reason
- can't get sqlfluff to work properly for dbt
  - for now just use sqlfluff from the command line

### Friday, October 21, 2022

- lua doesn't have regex for string pattern matching!!! 😶

### Monday, November 14, 2022

- split .zshrc into multiple files depending on machine
- from the zsh directory:
  - macos: `stow -t ~ macos`
  - wsl: `stow -t ~ wsl`

### Friday, November 25, 2022
- attempting to get some good spell completion but vim is just suggesting a bunch of weird crap
