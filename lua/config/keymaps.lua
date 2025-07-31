vim.g.mapleader = " "
vim.g.maplocalleader = ' '

local opts = { noremap = true, silent = true }

vim.keymap.set('n',  '<leader>jv', '<cmd> Ex <CR>', opts)

vim.keymap.set('n', '<C-d>', '<C-d>zz', opts)
vim.keymap.set('n', '<C-u>', '<C-u>zz', opts)

vim.keymap.set('n', '<C-f>', function()
  vim.cmd('normal! ggVG=go') 
end, opts) 
 
vim.keymap.set('n', '<C-o>', 'i <CR>', opts) 
 
vim.keymap.set('n', '<CR>', 'o <Esc>', opts) 
vim.keymap.set('n', '<Tab>', 'I <Tab> <Esc>', opts) 

