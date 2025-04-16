return {
	"epwalsh/obsidian.nvim",
	version = "*", -- recommended, use latest release instead of latest commit
	lazy = true,
	-- Replace the above line with this if you only want to load obsidian.nvim for markdown files in your vault:
	event = {
		-- If you want to use the home shortcut '~' here you need to call 'vim.fn.expand'.
		-- E.g. "BufReadPre " .. vim.fn.expand "~" .. "/my-vault/*.md"
		-- refer to `:h file-pattern` for more examples
		"BufReadPre "
			.. vim.fn.expand("~")
			.. "/ObsidianVaults/personal/*.md",
		"BufNewFile " .. vim.fn.expand("~") .. "/ObsidianVaults/personal/*.md",
		"BufReadPre " .. vim.fn.expand("~") .. "/ObsidianVaults/work/*.md",
		"BufNewFile " .. vim.fn.expand("~") .. "/ObsidianVaults/work/*.md",
	},
	dependencies = {
		-- Required.
		"nvim-lua/plenary.nvim",

		-- see below for full list of optional dependencies 👇
	},
	opts = {
		completion = {
			nvim_cmp = false,
		},
		workspaces = {
			{
				name = "personal",
				path = "~/ObsidianVaults/personal",
			},
			{
				name = "work",
				path = "~/ObsidianVaults/work",
			},
		},

		ui = {
			enable = false,
		},
		-- see below for full list of options 👇
		templates = {
			folder = "Templates",
			date_format = "%Y-%m-%d-%a",
			time_format = "%H:%M",
		},
		daily_notes = {
			-- Optional, if you keep daily notes in a separate directory.
			folder = "Notes/dailies",
			-- Optional, if you want to change the date format for the ID of daily notes.
			date_format = "%Y-%m-%d",
			-- Optional, if you want to change the date format of the default alias of daily notes.
			alias_format = "%B %-d, %Y",
			-- Optional, default tags to add to each new daily note created.
			default_tags = { "daily-notes" },
			-- Optional, if you want to automatically insert a template from your template directory like 'daily.md'
			template = nil,
		},
	},
	config = function(_, opts)
		require("obsidian").setup(opts)

		-- HACK: fix error, disable completion.nvim_cmp option, manually register sources
		local cmp = require("cmp")
		cmp.register_source("obsidian", require("cmp_obsidian").new())
		cmp.register_source("obsidian_new", require("cmp_obsidian_new").new())
		cmp.register_source("obsidian_tags", require("cmp_obsidian_tags").new())
	end,
}
