# 💤 LazyVim

A starter template for [LazyVim](https://github.com/LazyVim/LazyVim).
Refer to the [documentation](https://lazyvim.github.io/installation) to get started.

---

## Friday, March 17, 2023
I added `black` python formatter to the `null-ls` config. Following the instructions on the lazyvim website, the `opts` field will try to merge config with the lazyvim config. But since `opts` is defined as a function, I needed to copy the whole function to my own config, and add `black` there. I tested that `flake8` was not working unless I copied the entire function.

Note that there is extra `null-ls` config defined in the lazyvim repo, my extra config merges with that config.

(source)[https://www.lazyvim.org/configuration/plugins]

