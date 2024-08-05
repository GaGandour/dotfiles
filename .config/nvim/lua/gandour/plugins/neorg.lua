return {
	{
		"vhyrro/luarocks.nvim",
		priority = 1000,
		config = true,
	},
	{
		"nvim-neorg/neorg",
		dependencies = {
			"luarocks.nvim",
		},
        -- put any other flags you wanted to pass to lazy here!
		config = function()
			require("neorg").setup({
				load = {
					["core.defaults"] = {},
					["core.concealer"] = {},
					["core.dirman"] = {
					    config = {
					        workspaces = {
					            my_workspace = "~/neorg"
					        }
					    }
					}
				},
			})
		end,
	},
}
