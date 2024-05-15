return {
	"nvim-treesitter/nvim-treesitter",
	dependencies = {
		{
			"luckasRanarison/tree-sitter-hyprlang",
		},
	},
	config = function()
		local parser_config = require("nvim-treesitter.parsers").get_parser_configs()

		parser_config.nu = {
			install_info = {
				url = "https://github.com/nushell/tree-sitter-nu",
				files = { "src/parser.c" },
				branch = "main",
			},
			filetype = "nu",
		}

		local configs = require("nvim-treesitter.configs")

		configs.setup({
			ensure_installed = {
				"c",
				"lua",
				"vim",
				"vimdoc",
				"query",
				"python",
				"bash",
				"rust",
				"make",
				"cmake",
				"markdown",
				"markdown_inline",
				"yuck",
				"scss",
				"csv",
				"toml",
				"yaml",
				"json",
				"xml",
				"arduino",
				"gitignore",
				"gitcommit",
				"javascript",
				"html",
				"css",
				"hyprlang",
				"nu",
				"haskell",
				"printf",
				"matlab",
			},
			sync_install = false,
			highlight = {
				enable = true,
				additional_vim_regex_highlighting = true,
			},
			indent = { enable = true },
		})
	end,
	build = ":TSUpdate",
	event = "BufReadPre",
}
