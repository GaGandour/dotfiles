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
            "nvim-lua/plenary.nvim",
		},
        -- put any other flags you wanted to pass to lazy here!
		config = function()
			require("neorg").setup({
				load = {
					["core.defaults"] = {},
					["core.concealer"] = {
                        config = {
                            icon_preset = "diamond",
                        }
                    },
                    ["core.summary"] = {},
					["core.dirman"] = {
					    config = {
					        workspaces = {
					            my_notes = "~/Neorg/MyNotes"
					        },
                            default_workspace = "my_notes",
					    }
					}
				},
			})
		end,
	},
}
