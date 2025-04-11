-- Filename: ~/github/dotfiles-latest/neovim/neobean/lua/plugins/blink-cmp.lua
-- ~/github/dotfiles-latest/neovim/neobean/lua/plugins/blink-cmp.lua

-- HACK: blink.cmp updates | Remove LuaSnip | Emoji and Dictionary Sources | Fix Jump Autosave Issue
-- https://youtu.be/JrgfpWap_Pg

-- completion plugin with support for LSPs and external sources that updates
-- on every keystroke with minimal overhead

-- https://www.lazyvim.org/extras/coding/blink
-- https://github.com/saghen/blink.cmp
-- Documentation site: https://cmp.saghen.dev/

return {
	"saghen/blink.cmp",
	dependencies = { "rafamadriz/friendly-snippets" },
	enabled = true,
	opts = function(_, opts)
		-- I noticed that telescope was extremeley slow and taking too long to open,
		-- assumed related to blink, so disabled blink and in fact it was related
		-- :lua print(vim.bo[0].filetype)
		-- So I'm disabling blink.cmp for Telescope
		opts.enabled = function()
			-- Get the current buffer's filetype
			local filetype = vim.bo[0].filetype
			-- Disable for Telescope buffers
			if filetype == "TelescopePrompt" or filetype == "minifiles" or filetype == "snacks_picker_input" then
				return false
			end
			return true
		end

		-- NOTE: The new way to enable LuaSnip
		-- Merge custom sources with the existing ones from lazyvim
		-- NOTE: by default lazyvim already includes the lazydev source, so not adding it here again
		opts.sources = vim.tbl_deep_extend("force", opts.sources or {}, {
			default = { "lsp", "path", "snippets", "buffer" },
			providers = {
				lsp = {
					name = "lsp",
					enabled = true,
					module = "blink.cmp.sources.lsp",
					min_keyword_length = 0,
					score_offset = 90, -- the higher the number, the higher the priority
				},
				path = {
					name = "Path",
					module = "blink.cmp.sources.path",
					score_offset = 25,
					-- When typing a path, I would get snippets and text in the
					-- suggestions, I want those to show only if there are no path
					-- suggestions
					fallbacks = { "snippets", "buffer" },
					-- min_keyword_length = 2,
					opts = {
						trailing_slash = true,
						label_trailing_slash = true,
						get_cwd = function(context)
							return vim.fn.expand(("#%d:p:h"):format(context.bufnr))
						end,
						show_hidden_files_by_default = true,
					},
				},
				buffer = {
					name = "Buffer",
					enabled = true,
					max_items = 3,
					module = "blink.cmp.sources.buffer",
					min_keyword_length = 2,
					score_offset = 15, -- the higher the number, the higher the priority
				},
				snippets = {
					name = "snippets",
					enabled = true,
					max_items = 15,
					min_keyword_length = 2,
					module = "blink.cmp.sources.snippets",
					score_offset = 85, -- the higher the number, the higher the priority
				},
				-- -- Third class citizen mf always talking shit
				copilot = {
					name = "copilot",
					enabled = true,
					module = "blink-cmp-copilot",
					min_keyword_length = 6,
					score_offset = -100, -- the higher the number, the higher the priority
					async = true,
				},
			},
		})

		opts.cmdline = {
			enabled = true,
		}

		opts.completion = {
			menu = {
				border = "rounded",
			},
			documentation = {
				auto_show = true,
				window = {
					border = "rounded",
				},
			},
		}

		opts.fuzzy = {
			implementation = "lua",
		--   -- Disabling this matches the behavior of fzf
		--   use_typo_resistance = false,
		--   -- Frecency tracks the most recently/frequently used items and boosts the score of the item
		--   use_frecency = true,
		--   -- Proximity bonus boosts the score of items matching nearby words
		--   use_proximity = false,
		}

		opts.snippets = {
			preset = "luasnip", -- Choose LuaSnip as the snippet engine
		}

		-- The default preset used by lazyvim accepts completions with enter
		-- I don't like using enter because if on markdown and typing
		-- something, but you want to go to the line below, if you press enter,
		-- the completion will be accepted
		-- https://cmp.saghen.dev/configuration/keymap.html#default
		opts.keymap = {
			preset = "default",
			["<Tab>"] = { "snippet_forward", "fallback" },
			["<S-Tab>"] = { "snippet_backward", "fallback" },

			["<Up>"] = { "select_prev", "fallback" },
			["<Down>"] = { "select_next", "fallback" },
			["<C-k>"] = { "select_prev", "fallback" },
			["<C-j>"] = { "select_next", "fallback" },

			["<S-k>"] = { "scroll_documentation_up", "fallback" },
			["<S-j>"] = { "scroll_documentation_down", "fallback" },

			["<C-space>"] = { "show", "show_documentation", "hide_documentation" },
			["<C-e>"] = { "hide", "fallback" },
		}

		return opts
	end,
}
