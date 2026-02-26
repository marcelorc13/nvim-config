return {
  {
    "nvim-treesitter/nvim-treesitter",
	branch = 'master',
    build = ":TSUpdate",
	main = 'nvim-treesitter.config',
    config = function()
      require("nvim-treesitter.configs").setup {
        ensure_installed = {
          "javascript", "typescript", "tsx", "html", "css", "json",
          "go", "gomod", "gowork", "gosum",
          "lua", "vim", "vimdoc", "templ", "python", "sql", "markdown", "markdown_inline"
        },
		auto_install = true,
        highlight = {
          enable = true,
        },
        indent = {
          enable = true,
        },
        autotag = {
          enable = true,
        },
      }
    end,
  },
}
