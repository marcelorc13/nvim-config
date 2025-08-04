vim.g.mapleader = " "
vim.g.maplocalleader = " "

local opts = { noremap = true, silent = true }

vim.keymap.set('n',  '<leader>jv', '<cmd> Ex <CR>', opts)

vim.keymap.set('n', '<C-d>', '<C-d>zz', opts)
vim.keymap.set('n', '<C-u>', '<C-u>zz', opts)

vim.keymap.set('n', '<C-f>', function()
  vim.cmd('normal! ggVG=go') 
end, opts) 

vim.keymap.set('n', '<C-a>', function()
  vim.cmd('normal! GVgo') 
end, opts) 

vim.keymap.set('n', '<C-o>', 'i<CR><Esc>O', opts) 

vim.keymap.set('n', '<CR>', 'o<Esc>', opts) 
vim.keymap.set('n', '<Tab>', 'I<Tab><Esc>', opts) 

vim.keymap.set('n', '<leader>w', '<cmd> w <CR>', opts) 
vim.keymap.set('n', '<leader>W', '<cmd> wq <CR>', opts) 
vim.keymap.set('n', '<leader>q', '<cmd> q <CR>', opts) 
vim.keymap.set('n', '<leader>Q', '<cmd> q! <CR>', opts) 
vim.keymap.set('n', '<leader>s', '<cmd> so <CR>', opts) 

vim.keymap.set('n', '<leader><Tab>', '<cmd> bn <CR>', opts) 
vim.keymap.set('n', '<leader><S-Tab>', '<cmd> bp <CR>', opts) 

