return {
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",
			"hrsh7th/cmp-nvim-lsp",
			"folke/lazydev.nvim",
			"pmizio/typescript-tools.nvim",
			"p00f/clangd_extensions.nvim",
		},
		config = function()
			local cmp_nvim_lsp = require("cmp_nvim_lsp")
			local capabilities = vim.tbl_deep_extend(
				"force",
				{},
				vim.lsp.protocol.make_client_capabilities(),
				cmp_nvim_lsp.default_capabilities()
			)

			-- pre-LSP setups
			require("typescript-tools").setup({ on_attach = REGISTER_SERVER("tsserver"), capabilities = capabilities })

			-- LSP server setups
			local lsp = require("lspconfig")
			local servers = {
				"arduino_language_server",
				"bashls",
				"clangd",
				"cssls",
				"hls",
				"html",
				"lua_ls",
				"pyright",
				"ruff",
				"rust_analyzer",
			}

			for _, server in ipairs(servers) do
				if server == "arduino_language_server" then
					local arduino_capabilities = capabilities
					arduino_capabilities.textDocument.semanticTokens = vim.NIL
					arduino_capabilities.workspace.semanticTokens = vim.NIL

					lsp[server].setup({
						capabilities = arduino_capabilities,
						on_attach = REGISTER_SERVER(server),
					})
				elseif server == "lua_ls" then
					lsp[server].setup({
						capabilities = capabilities,
						on_attach = REGISTER_SERVER(server),
						settings = {
							Lua = {
								completion = { callSnippet = "Replace", showWord = "Fallback" },
								workspace = { checkThirdParty = "Disable" },
							},
						},
					})
				elseif server == "rust_analyzer" then
					lsp[server].setup({
						capabilities = capabilities,
						on_attach = REGISTER_SERVER(server),
						settings = { ["rust-analyzer"] = { checkOnSave = { command = "clippy" } } },
					})
				else
					lsp[server].setup({
						capabilities = capabilities,
						on_attach = REGISTER_SERVER(server),
					})
				end
			end

			vim.cmd("LspStart")
		end,
		event = "BufReadPre",
		keys = {
			-- navigation
			{
				"gd",
				function()
					return require("telescope.builtin").lsp_definitions()
				end,
				desc = "Goto definition",
			},
			{
				"gr",
				function()
					return require("telescope.builtin").lsp_references()
				end,
				desc = "References",
			},
			{
				"gD",
				vim.lsp.buf.declaration,
				desc = "Goto declaration",
			},
			{
				"gI",
				function()
					return require("telescope.builtin").lsp_implementations()
				end,
				desc = "Goto implementation",
			},
			{
				"gy",
				function()
					return require("telescope.builtin").lsp_type_definitions()
				end,
				desc = "Goto t[y]pe definition",
			},

			-- actions
			{
				"<leader>lc",
				function()
					vim.lsp.buf.code_action()
				end,
				desc = "Code actions",
			},
			{
				"<leader>lr",
				function()
					vim.lsp.buf.rename()
				end,
				desc = "Rename symbol",
			},
		},
	},
	{
		"nvimtools/none-ls.nvim",
		dependencies = {
			"williamboman/mason.nvim",
		},
		config = function()
			local null_ls = require("null-ls")

			null_ls.setup({
				sources = {},
				on_attach = REGISTER_SERVER("null-ls"),
			})
		end,
		event = "BufReadPre",
	},
	{
		"folke/lazydev.nvim",
		ft = "lua",
	},
}
