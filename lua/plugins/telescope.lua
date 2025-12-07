  return {
	'nvim-telescope/telescope.nvim',
	tag = 'v0.1.8',
	dependencies = { 'nvim-lua/plenary.nvim' },

	vim.keymap.set('n', '<leader>jf', ":Telescope find_files <CR>"),
	vim.keymap.set('n', '<leader>ff', ":Telescope live_grep <CR>"),
	vim.keymap.set('n', '<leader>jc', ":Telescope buffers <CR>"),
}
