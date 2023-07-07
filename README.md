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

#### update Saturday, March 18, 2023

copied idea to fish shell
from the fish directory:

- macos: `stow -t ~/.config/fish macos`
- wsl: `stow -t ~/.config/fish wsl`

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

- to get cd on quit working for nnn and fish: (https://github.com/jarun/nnn/blob/master/misc/quitcd/quitcd.fish)

### Friday, March 10, 2023

Add scripts directory and Brewfile that will store all my installed programs via brew and brew cask

- to generate brewfile: `brew bundle dump`

### Saturday, March 11, 2023

Migrate as many apps as possible to brew cask. Did not do `postgres.app` as homebrew is not the recommended way to install postgres

### Thursday, March 23, 2023

fun times trying to pin supercollider and deal with homebrew packages. Pinned supercollider using [homebrew-cask-upgrade](https://github.com/buo/homebrew-cask-upgrade) but when I run `brew upgrade` it ignores the pin. So then I was doing `brew install <package list>`, but that caused `brew bundle dump` to output those packages since they were explicitly installed, which I don't want.

There is [no way to mark packages as automatically installed](https://github.com/Homebrew/brew/issues/10754). For some reason `brew bundle cleanup --force` did not work, even after deleting those packages from the brew file. There is also [no way to remove a package from brew bundle](https://github.com/Homebrew/homebrew-bundle/issues/818)

The way to go is go into each package's `INSTALL_RECEIPT.json` file and change `installed_on_request` to false. Then run `brew bundle dump` and those packages no longer appear.

Will need to deal with supercollider separately 😁

### Thursday, March 30, 2023

Had to do `:TSInstall all` and then `:TSUpdate` to get rid of treesitter errors. This did install all treesitter languages but it doesn't matter.

### Wednesday, May 10, 2023

Could not seem to get combinations of 3 modifiers + letter working in neovim, so will need to come up with different keys for skhd, so I can use <C-A-letter> in neovim

Reason I want to do this is because I am using <A-letter> for tmux

Alternatives:

- <A-C-letter> - **this is actually available in lazyvim / vim**
- <A-M-letter> - used by macos sometimes
- <A-S-letter> - best used for tmux as "strong action"
- <C-M-letter> - used by macos sometimes
- <C-S-letter> - **this is actually available in lazyvim / vim**

  - best to avoid this one though, because some terminal emulators don't distinguish between uppercase and lowercase letters, so it's the same as sending <C-letter> which is already used by vim

- <M-S-letter> - used by apps / macos
  where A is option and M is command

### Monday, May 15, 2023

for visidata, for some reason this is an option but it doesn't work in .visidatarc:

```python
options.mouse_disable = True
```

do this instead:

```python
options.mouse_interval = 0 # disables the mouse-click
options.scroll_incr = 0    # disables the scroll wheel
```

not that I want to disable the mouse but visidata is freezing on mouse click at the moment.

### Thursday, July 06, 2023

#### neovim / wezterm block cursor issue

Following this thread [here](https://github.com/wez/wezterm/issues/2635), something I did worked to fix it but I don't even know what 🤣 all of a sudden it just started to work, after one of / multiple of the following:

- install wezterm-nightly
- add wezterm to .terminfo
- use both gruvbox wezterm and neovim themes

from [here](https://wezfurlong.org/wezterm/faq.html#how-do-i-enable-undercurl-curly-underlines):

```shell
tempfile=$(mktemp) \
  && curl -o $tempfile https://raw.githubusercontent.com/wez/wezterm/master/termwiz/data/wezterm.terminfo \
  && tic -x -o ~/.terminfo $tempfile \
  && rm $tempfile
```
