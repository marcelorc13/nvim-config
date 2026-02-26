return {
	'everviolet/nvim',
	name = 'evergarden',
	priority = 1000,
	opts = {
		theme = {
			variant = 'winter', -- 'winter'|'fall'|'spring'|'summer'
			accent = 'green',
		},
		editor = {
			transparent_background = true,
			sign = { color = 'none' },
			float = {
				color = 'mantle',
				solid_border = false,
			},
			completion = {
				color = 'surface0',
			},
		},
	},

	{
		'sainnhe/gruvbox-material',
		lazy = false,
		priority = 1000,
	},
	{
		'rebelot/kanagawa.nvim',
		lazy = false,
		priority = 1000,
	},
	{
		"vague-theme/vague.nvim",
		lazy = false,
		priority = 1000,
	},
	{
		"xero/miasma.nvim",
		lazy = false,
		priority = 1000,
	},
	{
		"rose-pine/neovim",
		name = "rose-pine",
		priority = 1000,
	}
}
