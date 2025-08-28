vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.wrap = false
vim.opt.colorcolumn = "90,120,150"

vim.opt.cursorline = true
vim.opt.guicursor = "a:block"
vim.opt.scrolloff = 10
vim.opt.sidescrolloff = 8
vim.opt.signcolumn = "yes"

vim.opt.winborder = "rounded"
vim.opt.tabstop = 4
vim.opt.shiftwidth = 2
vim.opt.smartindent = true
vim.opt.autoindent = true

vim.opt.backup = false
vim.opt.writebackup = false
vim.opt.swapfile = false
vim.opt.undofile = true
vim.opt.autoread = true
vim.opt.hidden = true

vim.opt.termguicolors = true
vim.opt.mouse = "a"
vim.opt.encoding = "UTF-8"
vim.opt.clipboard:append("unnamedplus")

vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.hlsearch = false
vim.opt.incsearch = true

local modeShower =
"%{mode() == 'n' ? 'N' : mode() == 'i' ? 'I' : mode() == 'i' ? 'I' : mode() == 'c' ? 'C' : mode() == 't' ? 'TERM' : mode()} "

vim.opt.statusline = modeShower .. " %f  %= %t %y"

vim.api.nvim_set_hl(0, "StatusLine", { bg= "#1d2021" })

