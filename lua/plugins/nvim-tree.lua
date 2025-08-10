return {
  "nvim-tree/nvim-tree.lua",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    require("nvim-tree").setup({
      view = {
		float = {
          enable = true,
          open_win_config = function()
            local screen_w = vim.o.columns
            local screen_h = vim.o.lines
            return {
              relative = "editor",
              border = "rounded",
              width = screen_w,
              height = screen_h - 2,
              row = 1,
              col = 0,
            }
          end,
	},
        width = 30,
      },
      renderer = {
        icons = {
          glyphs = {
            default = "",
            symlink = "",
            folder = {
              default = "",
              open = "",
            },
          },
        },
      },
      diagnostics = {
        enable = true,
      },
    })

    vim.keymap.set("n", "<leader>je", ":NvimTreeToggle<CR>", { desc = "Toggle NvimTree" })
  end,
}
