return {
	"folke/snacks.nvim",
	---@type snacks.Config
	opts = {
		bigfile = { enabled = true },
		dashboard = { enabled = false },
		explorer = { enabled = false },
		indent = { enabled = false },
		input = { enabled = false },
		notifier = { enabled = false },
		quickfile = { enabled = false },
		scope = { enabled = false },
		scroll = { enabled = true },
		statuscolumn = { enabled = false },
		words = { enabled = false },
		picker = {
			enabled = true,
			-- My ~/github/dotfiles-latest/neovim/lazyvim/lua/config/keymaps.lua
			-- file was always showing at the top, I needed a way to decrease its
			-- score, in frecency you could use :FrecencyDelete to delete a file
			-- from the database, here you can decrease it's score
			transform = function(item)
				return item
			end,
			-- In case you want to make sure that the score manipulation above works
			-- or if you want to check the score of each file
			debug = {
				scores = false, -- show scores in the list
			},
			-- I like the "ivy" layout, so I set it as the default globaly, you can
			-- still override it in different keymaps
			layout = {
				preset = "sidebar",
			},
			layouts = {
				-- I wanted to modify the ivy layout height and preview pane width,
				-- this is the only way I was able to do it
				-- NOTE: I don't think this is the right way as I'm declaring all the
				-- other values below, if you know a better way, let me know
				--
				-- Then call this layout in the keymaps above
				-- got example from here
				-- https://github.com/folke/snacks.nvim/discussions/468
				sidebar = {
					preview = "main",
					layout = {
						backdrop = false,
						width = 60,
						min_width = 40,
						height = 0,
						position = "left",
						border = "rounded",
						box = "vertical",
						{
							win = "input",
							height = 1,
							border = "rounded",
							title = "{title} {live} {flags}",
							title_pos = "center",
						},
						{ win = "list", border = "none" },
						{ win = "preview", title = "{preview}", height = 0.4, border = "rounded" },
					},
				},
			},
			matcher = {
				frecency = true,
			},
			win = {
				input = {
					keys = {
						-- to close the picker on ESC instead of going to normal mode,
						-- add the following keymap to your config
						-- ["<Esc>"] = { "close", mode = { "n", "i" } },
						-- I'm used to scrolling like this in LazyGit
						-- ["J"] = { "preview_scroll_down", mode = { "i", "n" } },
						-- ["K"] = { "preview_scroll_up", mode = { "i", "n" } },
						-- ["H"] = { "preview_scroll_left", mode = { "i", "n" } },
						-- ["L"] = { "preview_scroll_right", mode = { "i", "n" } },
					},
				},
			},
			formatters = {
				file = {
					filename_first = true, -- display filename before the file path
					truncate = 80,
				},
			},
		},
	},
	keys = {
		-- Open git log in vertical view
		{
			"<leader>fl",
			function()
				Snacks.picker.git_log({
					finder = "git_log",
					format = "git_log",
					preview = "git_show",
					confirm = "git_checkout",
					layout = "default",
				})
			end,
			desc = "Git Log",
		},
		-- Used in LazyVim to view the different keymaps, this by default is
		-- configured as <leader>sk but I run it too often
		-- Sometimes I need to see if a keymap is already taken or not
		{
			"<leader>k",
			function()
				Snacks.picker.keymaps({
					layout = "vertical",
				})
			end,
			desc = "Keymaps",
		},
		-- File picker
		{
			"<leader>ff",
			function()
				Snacks.picker.files({
					finder = "files",
					format = "file",
					show_empty = true,
					supports_live = true,
					hidden = true,
					-- In case you want to override the layout for this keymap
					-- layout = "vscode",
				})
			end,
			desc = "Find Files",
		},
		-- Navigate my buffers
		{
			"<leader>fb",
			function()
				Snacks.picker.buffers({
					-- I always want my buffers picker to start in normal mode
					on_show = function()
						vim.cmd.stopinsert()
					end,
					win = {
						input = {
							keys = {
								["d"] = { "bufdelete", mode = { "n" } },
							},
						},
						list = { keys = { ["d"] = "bufdelete" } },
					},
					-- In case you want to override the layout for this keymap
					-- layout = "ivy",
				})
			end,
			desc = "[f]Snacks picker [b]uffers",
		},
        -- Find marks
        {
            "<leader>fm",
            function()
                Snacks.picker.marks({
                    layout = "vertical",
					on_show = function()
						vim.cmd.stopinsert()
					end,
                })
            end,
            desc = "Find Marks",
        },
        -- Find strings
		{
			"<leader>fs",
			function()
				Snacks.picker.grep({
					hidden = true,
				})
			end,
			desc = "Grep",
		},
		{
			"<leader>fw",
			function()
				Snacks.picker.grep_word({
					hidden = true,
				})
			end,
			desc = "Visual selection or word",
			mode = { "n", "x" },
		},
		-- LSP
		{
			"gd",
			function()
				Snacks.picker.lsp_definitions()
			end,
			desc = "Goto Definition",
		},
		{
			"gD",
			function()
				Snacks.picker.lsp_declarations()
			end,
			desc = "Goto Declaration",
		},
		{
			"gr",
			function()
				Snacks.picker.lsp_references()
			end,
			nowait = true,
			desc = "References",
		},
		{
			"gi",
			function()
				Snacks.picker.lsp_implementations()
			end,
			desc = "Goto Implementation",
		},
		{
			"gt",
			function()
				Snacks.picker.lsp_type_definitions()
			end,
			desc = "Goto T[y]pe Definition",
		},
		{
			"<leader>d",
			function()
				Snacks.picker.diagnostics_buffer()
			end,
			desc = "Buffer Diagnostics",
		},
	},
}
