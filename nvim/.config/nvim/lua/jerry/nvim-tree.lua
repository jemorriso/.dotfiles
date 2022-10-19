require('nvim-tree').setup({
  actions = {
    expand_all = {
      exclude = {
        '.git',
      },
    },
  },
  open_on_setup = false,
  respect_buf_cwd = true,
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
    adaptive_size = false,
    width = 50,
  }
})
