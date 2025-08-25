return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      require("nvim-treesitter.configs").setup {
        ensure_installed = {
          "javascript", "typescript", "tsx", "html", "css", "json",
          "go", "gomod", "gowork", "gosum",
          "lua", "vim", "vimdoc", "templ", "python", "sql"
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
