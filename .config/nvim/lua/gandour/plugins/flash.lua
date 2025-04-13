return {
	{
		"folke/flash.nvim",
		event = "VeryLazy",
		---@type Flash.Config
		opts = {},
		-- stylua: ignore
		keys = {
		    { "<leader>l", mode = { "n", "x", "o" }, function() require("flash").jump() end,       desc = "Flash" },
		    { "<leader>L", mode = { "n", "x", "o" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },
		},
	},
	-- {
	-- 	"smoka7/hop.nvim",
	-- 	version = "*",
	-- 	opts = {
	-- 		keys = "etovxqpdygfblzhckisuran",
	-- 	},
	-- 	keys = {
	-- 		{ "<leader>l", mode = { "n", "x", "o" }, "<CMD>HopChar1MW<CR>", desc = "Hop to character" },
	-- 		{ "<leader>L", mode = { "n", "x", "o" }, "<CMD>HopPatternMW<CR>", desc = "Hop to pattern" },
	-- 	},
	-- },
}
