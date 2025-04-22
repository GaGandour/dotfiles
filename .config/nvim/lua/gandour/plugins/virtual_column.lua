return {
	"lukas-reineke/virt-column.nvim",
	opts = {
		char = { "▕" },
		virtcolumn = "120",
		highlight = { "Question" },
		exclude = {
			filetypes = {
				"markdown",
				"neorg",
				"lspinfo",
				"packer",
				"checkhealth",
				"help",
				"man",
				"TelescopePrompt",
				"TelescopeResults",
			},
			buftypes = { "nofile", "quickfix", "terminal", "prompt" },
		},
	},
}
