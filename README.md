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

### Wednesday, November 30, 2022

- don't stow `karabiner.json` because karabiner-elements overwrites the file. instead just try to remember to copy it over

> update: using goku instead

- to compile `karabiner.edn` to `karabiner.json`:

```
goku
```

### Tuesday, January 10, 2023

- bad times getting `tmux-256color` working on macos
- I finally got it by following the issue here: (https://github.com/htop-dev/htop/issues/251), downloading the file here: (https://gist.github.com/nicm/ea9cf3c93f22e0246ec858122d9abea1)
  and doing `tic -x tmux-256color` to install it to the folder that programs like ranger, nnn and visidata use
- tmux installed by homebrew uses a different ncurses version, macos one is old and doesn't have `tmux-256color`, which is why I have to install it to the
  directory used by the system ncurses. I think.

- adding list of homebrew packages that I'll try to keep up to date

### Monday, February 13, 2023

- installed `moc` in order to use audio preview nnn plugin, `mocq`
- note that the `jack` daemon must be running in order to use `moc` (`brew services start jack`)
- i actually did a custom version befure I realized you can just use the above one:

`set -gx NNN_PLUG 'a:!afplay "$nnn" & *`

- run any cli command by using `!`, on current file `"$nnn"`, in background `&` and without confirmation on completion `*`

### Saturday, March 04, 2023
- using [YabaiIndicator](https://github.com/xiamaz/YabaiIndicator)
