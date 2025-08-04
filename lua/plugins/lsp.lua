return {
	{ "williamboman/mason.nvim", config = true },
	{
		"williamboman/mason-lspconfig.nvim",
		dependencies = {
			"neovim/nvim-lspconfig",
			"williamboman/mason.nvim",
		},
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = { "lua_ls", "gopls" },
			})

			local lspconfig = require("lspconfig")

			local on_attach = function(_, bufnr)
				local map = function(mode, lhs, rhs, desc)
					vim.keymap.set(mode, lhs, rhs, { buffer = bufnr, desc = desc })
				end
				map("n", "gd", vim.lsp.buf.definition, "Ir para definição")
				map("n", "K", vim.lsp.buf.hover, "Hover")
				map("n", "gr", vim.lsp.buf.references, "Referências")
				map("n", "<leader>rn", vim.lsp.buf.rename, "Renomear")
				map("n", "<leader>ca", vim.lsp.buf.code_action, "Code Action")
				map("n", "<leader>f", function() vim.lsp.buf.format { async = true } end, "Formatar")
			end

			local servers = {
				lua_ls = {
					settings = {
						Lua = {
							runtime = { version = "LuaJIT" },
							diagnostics = { globals = { "vim" } },
							workspace = { checkThirdParty = false },
							telemetry = { enable = false },
						}
					}
				},
				gopls = {
					settings = {
						gopls = {
							gofumpt = true,
							staticcheck = true,
							analyses = {
								unusedparams = true,
								shadow = true,
							},
						}
					}
				}
			}

			for server, config in pairs(servers) do
				config.on_attach = on_attach
				lspconfig[server].setup(config)
			end
		end,
	}
}
