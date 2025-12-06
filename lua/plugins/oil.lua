return {
	'stevearc/oil.nvim',
	---@module 'oil'
	---@type oil.SetupOpts
	opts = {},
	dependencies = { "nvim-tree/nvim-web-devicons" },
	use_dafault_keymaps = true,

	lazy = false,
	vim.keymap.set("n", "<leader>je", ":Oil<CR>")
}
