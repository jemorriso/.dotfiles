require("nvim-tree").setup({
  actions = {
    expand_all = {
      exclude = {
        ".git",
      },
    },
  },
  open_on_setup = true,
  renderer = {
    icons = {
      show = {
        file = true,
        folder = false,
        folder_arrow = true,
        git = true,
      },
    },
  },
  view = {
    adaptive_size = true,
  }
})
