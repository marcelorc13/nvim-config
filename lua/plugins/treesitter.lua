return {
  {
    "nvim-treesitter/nvim-treesitter",
	dependencies = { "OXY2DEV/markview.nvim" },
    build = ":TSUpdate",
    config = function()
      require("nvim-treesitter.configs").setup {
        ensure_installed = {
          "javascript", "typescript", "tsx", "html", "css", "json",
          "go", "gomod", "gowork", "gosum",
          "lua", "vim", "vimdoc", "templ", "python", "sql", "markdown", "markdown_inline"
        },
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
