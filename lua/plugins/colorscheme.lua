return {
	'everviolet/nvim', name = 'evergarden',
	priority = 1000,
	opts = {
		theme = {
			variant = 'fall', -- 'winter'|'fall'|'spring'|'summer'
			accent = 'green',
		},
		editor = {
			transparent_background = false,
			sign = { color = 'none' },
			float = {
				color = 'mantle',
				solid_border = false,
			},
			completion = {
				color = 'surface0',
			},
		},
	}
}
