return {
	{
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		opts = {
			ensure_installed = {
				"arduino-language-server",
				"bash-language-server",
				"black",
				"clangd",
				"clang-format",
				"css-lsp",
                "haskell-language-server",
				"html-lsp",
				"isort",
				"lua-language-server",
				"pyright",
                "ruff",
				"rust-analyzer",
				"stylua",
				"typescript-language-server",
			},
		},
		cmd = { "MasonToolsInstall", "MasonToolsClean", "MasonToolsUpdate" },
	},
	{
		"williamboman/mason.nvim",
		lazy = true,
		dependencies = {
			"williamboman/mason-lspconfig.nvim",
			"WhoIsSethDaniel/mason-tool-installer.nvim",
		},
		config = function()
			require("mason").setup()
			require("mason-lspconfig").setup()

			vim.cmd("MasonToolsClean")
			vim.cmd("MasonToolsUpdate")
		end,
	},
}
