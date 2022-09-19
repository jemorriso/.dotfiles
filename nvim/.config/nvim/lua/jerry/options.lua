vim.opt.fileencoding = 'utf-8'
vim.opt.encoding = 'utf-8'

vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.sidescrolloff = 3
vim.opt.scrolloff = 3

vim.opt.incsearch = true

vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.opt.mouse = 'a'

vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.smarttab = true

vim.opt.autoindent = true
vim.opt.smartindent = true

vim.opt.wildmenu = true
vim.opt.wildmode = {'longest', 'full'}

vim.opt.completeopt = {'menuone', 'noselect'}

vim.opt.hidden = true
vim.opt.splitbelow = true
vim.opt.splitright = true

vim.opt.formatoptions:remove({'r', 'o'})

vim.opt.termguicolors = true
vim.opt.background = 'dark'

vim.wo.wrap = false

vim.g.netrw_banner = 0
vim.g.netrw_browse_split = 4
vim.g.netrw_hide = 0
vim.g.netrw_liststyle = 3
vim.g.netrw_winsize = 25 

vim.g.mapleader = ' '

vim.g.catppuccin_flavour = "macchiato"
vim.cmd[[colorscheme catppuccin]]
