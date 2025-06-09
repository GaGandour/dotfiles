return {
	{
		"yetone/avante.nvim",
		event = "VeryLazy",
		version = false, -- Never set this value to "*"! Never!
		opts = {
			-- add any opts here
			-- for example
			provider = "copilot",
			mode = "agentic", -- legacy or agentic
			providers = {
				ollama = {
					model = "gemma3:4b",
				},
				copilot = {
					model = "claude-3.7-sonnet",
				},
			},
			windows = {
				edit = { border = "rounded" },
				ask = {
					floating = false, -- Open the 'AvanteAsk' prompt in a floating window
					start_insert = true, -- Start insert mode when opening the ask window
					border = "rounded",
				},
			},
			behaviour = {
				auto_focus_sidebar = true,
				auto_suggestions = false, -- Experimental stage
				auto_suggestions_respect_ignore = false,
				use_cwd_as_project_root = true,
				enable_cursor_planning_mode = true,
			},
			-- Maps
			-- vim.keymap.set({ "n", "v" }, "<leader>ak", ":AvanteChat<CR>"),
			vim.keymap.set({ "n", "v" }, "<leader>a", ":AvanteToggle<CR>"),
		},
		-- if you want to build from source then do `make BUILD_FROM_SOURCE=true`
		build = "make",
		-- build = "powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false" -- for windows
		dependencies = {
			"nvim-treesitter/nvim-treesitter",
			"stevearc/dressing.nvim",
			"nvim-lua/plenary.nvim",
			"MunifTanjim/nui.nvim",
		},
	},
}
