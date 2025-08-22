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
				map("n", "<leader>rr", vim.lsp.buf.rename, "Renomear")
				map("n", "<leader>ca", vim.lsp.buf.code_action, "Code Action")
				map("n", "<leader>F", function() vim.lsp.buf.format { async = true } end, "Formatar")

				vim.api.nvim_create_autocmd("BufWritePre", {
					pattern = { "*.ts", "*.tsx", "*.js", "*.jsx" },
					callback = function()
						vim.lsp.buf.code_action({
							context = { only = { "source.organizeImports" } },
							apply = true,
						})
					end,
				})
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
				},
				pyright = {
					settings = {
						python = {
							analysis = {
								autoSearchPaths = true,
								diagnosticMode = "workspace",
								useLibraryCodeForTypes = true,
								typeCheckingMode = "basic",
							}
						}
					}
				},
				tinymist = {},

				ts_ls = {
					settings = {},
					filetypes = { "typescript", "typescriptreact", "typescript.tsx", "javascript", "javascriptreact" },
				},
				tmpl = {
					settings = {},
					filetypes = { "templ" },
				},
				sqls = {
					settings = {
						sqls = {
							lowerCaseKeywords = false,
							format = {
								enable = true,
								indentSize = 2,
								alignColumnDefinitionsInCreateTable = true,
							},
							lint = {
								enable = true,
								severity = "warning",
							},
							completion = {
								enable = true,
								caseSensitive = "preserve",
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
