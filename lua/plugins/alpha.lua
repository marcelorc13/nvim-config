return{
		'goolord/alpha-nvim',
		dependencies = { 'echasnovski/mini.icons' },
		config = function()
			require('alpha').setup(require 'alpha.themes.dashboard'.config)
			local theme = require("alpha.themes.dashboard")

			local new_file_utils = require("utils.new_file")

			theme.section.header.val = {
				"                                                               ",
				"      _____        ______    ____                _____         ",
				"  ___|\\    \\   ___|\\     \\  |    |          ____|\\    \\        ",
				" /    /\\    \\ |     \\     \\ |    |         /     /\\    \\       ",
				"|    |  |    ||     ,_____/||    |        /     /  \\    \\      ",
				"|    |  |____||     \\--'\\_|/|    |  ____ |     |    |    |     ",
				"|    |   ____ |     /___/|  |    | |    ||     |    |    |     ",
				"|    |  |    ||     \\____|\\ |    | |    ||\\     \\  /    /|     ",
				"|\\ ___\\/    /||____ '     /||____|/____/|| \\_____\\/____/ |     ",
				"| |   /____/ ||    /_____/ ||    |     || \\ |    ||    | /     ",
				" \\|___|    | /|____|     | /|____|_____|/  \\|____||____|/      ",
				"      |____|/      |_____|/                                   ",
				"                                                               ",
				" _____   ______    ____      ____  ____      ______  _______   ",
				"|\\    \\ |\\     \\  |    |    |    ||    |    |      \\/       \\  ",
				" \\\\    \\| \\     \\ |    |    |    ||    |   /          /\\     \\ ",
				"  \\|    \\  \\     ||    |    |    ||    |  /     /\\   / /\\     |",
				"   |     \\  |    ||    |    |    ||    | /     /\\ \\_/ / /    /|",
				"   |      \\ |    ||    |    |    ||    ||     |  \\|_|/ /    / |",
				"   |    |\\ \\|    ||\\    \\  /    /||    ||     |       |    |  |",
				"   |____||\\_____/|| \\ ___\\/___ / ||____||\\____\\       |____|  /",
				"   |    |/ \\|   || \\ |   ||   | / |    || |    |      |    | / ",
				"   |____|   |___|/  \\|___||___|/  |____| \\|____|      |____|/  ",
				"                                                               ", }
			theme.section.buttons.val = {
				theme.button("e", " Open project", ":Oil <CR>"),
				theme.button("f", " New file", ":lua require('utils.new_file').create_and_open_file() <CR>"),
				theme.button("c", " Settings (.config/nvim)",
					":lua require('nvim-tree.api').tree.open({ path = vim.fn.stdpath('config') }) <CR>"),
				theme.button("q", "󰗽 Quit", ":q <CR>")
			}
		end
}
