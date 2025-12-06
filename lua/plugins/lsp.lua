return {
	{ "williamboman/mason.nvim", config = true },
	{
		"williamboman/mason-lspconfig.nvim",
		dependencies = {
			"neovim/nvim-lspconfig",
			"williamboman/mason.nvim",
			"hrsh7th/cmp-nvim-lsp",
		},
		config = function()
			vim.api.nvim_create_autocmd("LspAttach", {
				group = vim.api.nvim_create_augroup("UserLspConfig", {}),
				callback = function(ev)
					local client = vim.lsp.get_client_by_id(ev.data.client_id)
					local opts = { buffer = ev.buf }

					local map = function(mode, lhs, rhs, desc)
						opts.desc = desc
						vim.keymap.set(mode, lhs, rhs, opts)
					end

					map("n", "K", vim.lsp.buf.hover, "Hover")
					map("n", "gr", vim.lsp.buf.references, "Referências")
					map("n", "gd", vim.lsp.buf.definition, "Ir para definição")
					map("n", "<leader>rr", vim.lsp.buf.rename, "Renomear")
					map("n", "<leader>ca", vim.lsp.buf.code_action, "Code Action")
					map("n", "<leader>F", function()
						vim.lsp.buf.format({ async = true })
					end, "Formatar")

					local ft = vim.bo[ev.buf].filetype
					if ft == "typescript" or ft == "typescriptreact" or ft == "javascript" or ft == "javascriptreact" then
						vim.api.nvim_create_autocmd("BufWritePre", {
							buffer = ev.buf,
							callback = function()
								vim.lsp.buf.code_action({
									context = { only = { "source.organizeImports" } },
									apply = true,
								})
							end,
						})
					end
				end,
			})

			local capabilities = vim.lsp.protocol.make_client_capabilities()
			local ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
			if ok then
				capabilities = cmp_nvim_lsp.default_capabilities()
			end

			local util = require("lspconfig.util")
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
							analyses = { unusedparams = true, shadow = true },
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
				ts_ls = {},
				templ = {
					filetypes = { "templ" },
					root_dir = util.root_pattern("go.mod", ".git"),
				},
				yamlls = {
					filetypes = { "yaml" },
				},
			}

			require("mason-lspconfig").setup({
				ensure_installed = { "lua_ls", "gopls", "templ", "ts_ls", "pyright", "tinymist", "yamlls" },
				handlers = {
					function(server_name)
						local server_config = servers[server_name] or {}
						server_config.capabilities = capabilities
						require("lspconfig")[server_name].setup(server_config)
					end,
				}
			})
		end,
	}
}
