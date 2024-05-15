local function current_servers()
	local servers = LSP_SERVERS[vim.api.nvim_get_current_buf()] or {}

	local current = ""
	local num_servers = 0
	for server, loaded in pairs(servers) do
		if loaded then
			current = current .. " " .. server
			num_servers = num_servers + 1
		end
	end

	if num_servers ~= 0 then
		current = "󰒋" .. current
	end

	return current
end

return {
	"nvim-lualine/lualine.nvim",
	dependencies = "nvim-tree/nvim-web-devicons",
	lazy = false,
	opts = {
		options = {
			theme = COLOR_THEME,
			component_separators = { left = "", right = "" },
			section_separators = { left = "", right = "" },
			globalstatus = true,
		},
		sections = {
			lualine_a = {
				{ "mode", separator = { left = "", right = "" } },
			},
			lualine_b = { "branch", "diff", "diagnostics" },
			lualine_c = { current_servers },
			lualine_x = { "encoding", "fileformat", "filetype" },
			lualine_y = { "progress" },
			lualine_z = {
				{ "location", separator = { left = "", right = "" } },
			},
		},
		tabline = {
			lualine_a = {
				{
					"buffers",
					separator = { left = "", right = "" },
					buffers_color = { inactive = "lualine_b_normal" },
					symbols = { alternate_file = "󰤖 " },
				},
			},
			lualine_z = {
				{
					"tabs",
					separator = { left = "", right = "" },
					tabs_color = { inactive = "lualine_b_normal" },
					symbols = { modified = " ●" },
				},
			},
		},
		extensions = { "lazy" },
	},
	keys = {
		{
			"<leader>bx",
			"<cmd>bd<cr>",
			desc = "Close current buffer",
		},
		{
			"<leader>bp",
			"<cmd>bp<cr>",
			desc = "Jump to previous buffer",
		},
		{
			"<leader>bn",
			"<cmd>bn<cr>",
			desc = "Jump to next buffer",
		},
		{
			"<leader>b1",
			"<cmd>LualineBuffersJump! 1<cr>",
			desc = "Jump to buffer 1",
		},
		{
			"<leader>b2",
			"<cmd>LualineBuffersJump! 2<cr>",
			desc = "Jump to buffer 2",
		},
		{
			"<leader>b3",
			"<cmd>LualineBuffersJump! 3<cr>",
			desc = "Jump to buffer 3",
		},
		{
			"<leader>b4",
			"<cmd>LualineBuffersJump! 4<cr>",
			desc = "Jump to buffer 4",
		},
		{
			"<leader>b5",
			"<cmd>LualineBuffersJump! 5<cr>",
			desc = "Jump to buffer 5",
		},
		{
			"<leader>b6",
			"<cmd>LualineBuffersJump! 6<cr>",
			desc = "Jump to buffer 6",
		},
		{
			"<leader>b7",
			"<cmd>LualineBuffersJump! 7<cr>",
			desc = "Jump to buffer 7",
		},
		{
			"<leader>b8",
			"<cmd>LualineBuffersJump! 8<cr>",
			desc = "Jump to buffer 8",
		},
		{
			"<leader>b9",
			"<cmd>LualineBuffersJump! 9<cr>",
			desc = "Jump to buffer 9",
		},
	},
}
