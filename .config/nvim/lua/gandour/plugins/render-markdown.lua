return {
	-- Make sure to set this up properly if you have lazy=true
	"MeanderingProgrammer/render-markdown.nvim",
	dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-tree/nvim-web-devicons" },
	ft = { "markdown", "Avante" },
	config = function()
		require("render-markdown").setup({
			file_types = { "markdown", "Avante" },
			preset = "obsidian",
			completions = {
				blink = { enabled = true },
				lsp = { enabled = true },
				filter = {
					callout = function(value)
						-- example to exclude obsidian callouts
						return value.category ~= "obsidian"
						-- return true
					end,
				},
			},
			checkbox = {
				-- Turn on / off checkbox state rendering.
				enabled = true,
				-- Additional modes to render checkboxes.
				render_modes = false,
				-- Padding to add to the right of checkboxes.
				right_pad = 5,
			},
		})
	end,
}
-- For `plugins/markview.lua` users.
-- return {
-- 	"OXY2DEV/markview.nvim",
-- 	lazy = false,
--
-- 	-- For blink.cmp's completion source
-- 	dependencies = {
-- 		"saghen/blink.cmp",
-- 		"catppuccin/nvim",
-- 	},
--
-- 	config = function()
-- 		require("markview").setup({
-- 			preview = {
-- 				icon_provider = "devicons",
-- 				filetypes = { "md", "rmd", "quarto" },
-- 			},
-- 		})
-- 	end,
-- }
