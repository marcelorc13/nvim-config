return {
    'stevearc/oil.nvim',
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {
        use_default_keymaps = true,
        win_options = {
            signcolumn = "yes:2",
        },
    },

    keys = {
        { "<leader>je", "<cmd>Oil<cr>", desc = "Abrir Oil" },
    },
}
