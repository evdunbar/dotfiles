return {
	"stevearc/conform.nvim",
	init = function()
		vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
	end,
	opts = {
		formatters_by_ft = {
            c = { "clang-format" },
            cpp = { "clang-format" },
			lua = { "stylua" },
			python = { "ruff_fix" },
            rust = { "rustfmt" },
		},
	},
	cmd = "ConformInfo",
	keys = {
		{
			"<leader>lf",
			function()
				require("conform").format({ lsp_fallback = true })
			end,
			desc = "Format buffer",
		},
	},
}
