return {
	"obsidian-nvim/obsidian.nvim",
	version = "*", -- recommended, use latest release instead of latest commit
	lazy = true,
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
			blink = true,
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
			checkboxes = {
				-- I want only done/not done options to be available.
				[" "] = { char = "󰄱", hl_group = "ObsidianTodo" },
				["x"] = { char = "", hl_group = "ObsidianDone" },
			},
		},
		-- see below for full list of options 👇
		templates = {
			folder = "Templates",
			date_format = "%Y-%m-%d (%a)",
			time_format = "%H:%M",
		},
		picker = {
			name = "snacks.pick",
		},
		daily_notes = {
			-- Optional, if you keep daily notes in a separate directory.
			folder = "5.Dailies",
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

		local function create_obsidian_note_from_template(note_dir, project_name, note_title, template_name, client)
			local note = nil
			note = client:create_note({
				title = note_title,
				dir = note_dir,
				template = template_name,
				tags = { project_name },
			})
			-- Open the note in a new buffer.
			client:open_note(note, { sync = true })
		end

		local function create_obsidian_project(project_name)
			local project_path = vim.fn.getcwd(-1) .. "/1.Projects/" .. project_name .. "/"

			-- Check if the project directory already exists
			if vim.fn.isdirectory(project_path) == 1 then
				error("Project '" .. project_name .. "' already exists in Projects/")
			end

			-- Create the project directory
			vim.fn.mkdir(project_path, "p")

			local client = require("obsidian").get_client()

			local note_title_prefix = string.lower(project_name)
			create_obsidian_note_from_template(
				project_path,
				project_name,
				note_title_prefix .. "-log",
				"project-log.md",
				client
			)
			create_obsidian_note_from_template(
				project_path,
				project_name,
				note_title_prefix .. "-tasks",
				"project-tasks.md",
				client
			)
			create_obsidian_note_from_template(
				project_path,
				project_name,
				note_title_prefix .. "-about",
				"project-about.md",
				client
			)

			print("Project '" .. project_name .. "' created successfully in Projects/")
		end

		-- Register the command in Neovim
		vim.api.nvim_create_user_command("ObsidianCreateProject", function(loc_opts)
			create_obsidian_project(loc_opts.args)
		end, { nargs = 1 })
	end,
	keys = {
		{
			"<localleader>t",
			"<cmd>lua vim.api.nvim_put({os.date('%Y-%m-%d (%a)')}, '', true, true)<cr>",
			desc = "Insert current date",
		},
		{
			"<localleader>n",
			"<cmd>lua vim.api.nvim_put({os.date('%H:%M')}, '', true, true)<cr>",
			desc = "Insert current time",
		},
	},
}
