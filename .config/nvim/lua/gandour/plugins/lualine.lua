return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		local lualine = require("lualine")
		-- local lazy_status = require("lazy.status") -- to configure lazy pending updates count

		-- configure lualine with modified theme
		lualine.setup({
			options = {
				-- theme = my_lualine_theme,
				theme = "catppuccin-frappe",
				component_separators = "│",
				section_separators = "",
			},
			sections = {
				-- lualine_a = { "mode" }, -- default
				lualine_b = { "diff", "diagnostics" }, -- removed git branch, as this can be viewed in lazy git
				lualine_c = {
					{
						"filename",
						path = 1,
						-- shorting_target = 40, -- Shortens the path to keep statusline ≤ 40 chars
					},
				},
				lualine_x = {
					-- {
					-- 	lazy_status.updates,
					-- 	cond = lazy_status.has_updates,
					-- 	color = { fg = "#ff9e64" },
					-- },
					{ "encoding" },
					-- { "fileformat" }, -- Penguin icon for some reason
					{ "filetype" },
				},
			},
		})
	end,
}
