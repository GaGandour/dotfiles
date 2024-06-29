return {
	{
		"catppuccin/nvim",
		name = "catppuccin",
		priority = 1000,
	},
	{
		"folke/tokyonight.nvim",
		priority = 1000, -- make sure to load this before all the other start plugins
		config = function()
			require("tokyonight").setup({
				style = "moon",
			})
		end,
	},
	{
		--     "scottmckendry/cyberdream.nvim",
		--     lazy = false,
		--     priority = 1000,
		--     config = function()
		--         require("cyberdream").setup({
		--             -- Enable transparent background
		--             transparent = true,
		--
		--             -- Enable italics comments
		--             italic_comments = false,
		--
		--             -- Replace all fillchars with ' ' for the ultimate clean look
		--             hide_fillchars = true,
		--
		--             -- Modern borderless telescope theme
		--             borderless_telescope = false,
		--
		--             -- Set terminal colors used in `:terminal`
		--             terminal_colors = true,
		--
		--             theme = {
		--                 variant = "default", -- use "light" for the light variant
		--                 highlights = {
		--                     -- Highlight groups to override, adding new groups is also possible
		--                     -- See `:h highlight-groups` for a list of highlight groups or run `:hi` to see all groups and their current values
		--
		--                     -- Comments in blue
		--                     Comment = { fg = "#00ccff", bg = "NONE", italic = true },
		--                     -- Line number
		--                     LineNr = { fg = "#cfcfcf", bg = "NONE", italic = false },
		--                     -- Indentation marking
		--                     IblIndent = { fg = "#a8f2ff", bg = "NONE", italic = false },
		--                     IblScope = { fg = "#a8f2ff", bg = "NONE", italic = false },
		--                     -- Visual mode highlighting
		--                     Visual = { bg = "#9725f2" },
		--                     -- Complete list can be found in `lua/cyberdream/theme.lua`
		--                 },
		--
		--                 -- Override a color entirely
		--                 colors = {
		--                     -- For a list of colors see `lua/cyberdream/colours.lua`
		--                     -- Example:
		--                     bg = "#000000",
		--                     green = "#00ff00",
		--                     magenta = "#ff00ff",
		--                     bgHighlight = "#999999",
		--                     red = "#ff1e05",
		--                     purple = "#b5bcff",
		--                 },
		--             },
		--         })
		--     end,
	},
}
